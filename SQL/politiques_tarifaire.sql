DROP TRIGGER IF EXISTS  politique ON billets;
DROP FUNCTION IF EXISTS  politique();
DROP FUNCTION IF EXISTS  politique2(billets);
DROP FUNCTION IF EXISTS  politique3(billets);
DROP FUNCTION IF EXISTS  current_d();

DROP TRIGGER IF EXISTS  limite_billets ON billets;
DROP FUNCTION IF EXISTS  test_limite();

CREATE FUNCTION current_d() RETURNS date AS $$
BEGIN
	RETURN CURRENT_DATE;
END; 
$$ LANGUAGE plpgsql;

CREATE FUNCTION politique() RETURNS trigger AS $$ 
DECLARE d date;
BEGIN
    IF NEW.prix_effective IS NOT NULL THEN
    	RETURN NEW;
    END IF;
    
    SELECT date_vente INTO d FROM representations WHERE date_rep = NEW.date_rep AND heure_rep = NEW.heure_rep;
    
    IF current_d() - d <= 5 THEN
    	NEW.prix_effective := NEW.valeur_tarif * 0.8;
    ELSE
    	NEW.prix_effective := NEW.valeur_tarif;
    END IF;
    
    RETURN politique2(NEW);
END; 
$$ LANGUAGE plpgsql;

CREATE FUNCTION politique2(n billets) RETURNS billets AS $$ 
DECLARE d date; co real; id_s real; ca real;
BEGIN
	
    
    SELECT date_vente INTO d FROM representations WHERE date_rep = n.date_rep AND heure_rep = n.heure_rep;
    
    IF current_d() - d > 15 THEN 
    	n.prix_effective := n.prix_effective;
    ELSE
    	SELECT count(*) INTO co FROM billets;
        SELECT id_spectacle INTO id_s FROM representations WHERE date_rep = n.date_rep AND heure_rep = n.heure_rep;
        SELECT capacite INTO ca FROM spectacles WHERE id = id_s;
        IF co <= ca * 0.3 THEN
            n.prix_effective := n.prix_effective * 0.5;
        ELSIF co <= ca * 0.5 THEN
            n.prix_effective := n.prix_effective * 0.7;
        ELSE
            n.prix_effective := n.prix_effective;
        END IF;     
    END IF;
 
    RETURN politique3(n);
END; 
$$ LANGUAGE plpgsql;

CREATE FUNCTION politique3(n billets) RETURNS billets AS $$ 
DECLARE d date; co int; id_s int; ca int;
BEGIN    
    SELECT count(*) INTO co FROM billets;
    SELECT id_spectacle INTO id_s FROM representations WHERE date_rep = n.date_rep AND heure_rep = n.heure_rep;
    SELECT capacite INTO ca FROM spectacles WHERE id = id_s;
    
    IF co < ca * 0.3 THEN
    	n.prix_effective := n.prix_effective * 0.9;
    ELSE
	n.prix_effective := NEW.prix_effective;
    END IF;
    
    RETURN n;
END; 
$$ LANGUAGE plpgsql;

CREATE FUNCTION test_limite() RETURNS trigger AS $$ 
DECLARE co int; id_s int; ca int;
BEGIN
    SELECT count(*) INTO co FROM billets;
    SELECT id_spectacle INTO id_s FROM representations WHERE date_rep = n.date_rep AND heure_rep = n.heure_rep;
    SELECT capacite INTO ca FROM spectacles WHERE id = id_s;

    IF co < ca THEN
	RETURN NEW;
    ELSE
	RAISE EXCEPTION 'Nombre de billet depasse la capacité de la salle';
    END IF;
END; 
$$ LANGUAGE plpgsql;



CREATE TRIGGER politique
BEFORE INSERT OR UPDATE ON billets
FOR EACH ROW
EXECUTE PROCEDURE politique();

CREATE TRIGGER limite_billets
BEFORE INSERT OR UPDATE ON billets
FOR EACH ROW
EXECUTE PROCEDURE test_limite();

