DROP TRIGGER IF EXISTS  tarifs_billets ON billets;
DROP FUNCTION IF EXISTS verifie_tarif_du_spectacle();


CREATE FUNCTION verifie_tarif_du_spectacle() RETURNS trigger AS $$ 
DECLARE id_s int; o spec_tar%ROWTYPE;
BEGIN
    SELECT id_spectacle INTO id_s FROM representations WHERE date_rep = NEW.date_rep AND heure_rep = NEW.heure_rep;
    SELECT * INTO o FROM spec_tar WHERE id_spectacle = id_s AND type_tarif = NEW.type_tarif AND valeur_tarif = NEW.valeur_tarif;
    IF NOT FOUND THEN 
    	RAISE EXCEPTION 'Tarif not present in spec_tar table';
    END IF;
    RETURN NEW;
END; 
$$ LANGUAGE plpgsql;


CREATE TRIGGER tarifs_billets
BEFORE INSERT OR UPDATE ON billets
FOR EACH ROW
EXECUTE PROCEDURE verifie_tarif_du_spectacle();