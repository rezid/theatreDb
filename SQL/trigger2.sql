CREATE FUNCTION verifie_spectacle_is_not_achete() RETURNS trigger AS $$ 
DECLARE id_s int;
BEGIN
    SELECT id INTO id_s FROM spectacles_achete WHERE id = NEW.id;
    IF NOT FOUND THEN RETURN NEW;
    END IF;
    RETURN NULL;
END; 
$$ LANGUAGE plpgsql;


CREATE TRIGGER spectacle
BEFORE INSERT OR UPDATE ON nos_spectacles
FOR EACH ROW
EXECUTE PROCEDURE verifie_spectacle_is_not_achete();