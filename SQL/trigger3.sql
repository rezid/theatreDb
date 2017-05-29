CREATE FUNCTION verifie_spectacle_is_nos() RETURNS trigger AS $$ 
DECLARE id_s int;
BEGIN
    SELECT id INTO id_s FROM nos_spectacles WHERE id = NEW.id;
    IF NOT FOUND THEN RETURN NEW;
    END IF;
    RETURN NULL;
END; 
$$ LANGUAGE plpgsql;


CREATE TRIGGER spectacle
BEFORE INSERT OR UPDATE ON spectacles_achete
FOR EACH ROW
EXECUTE PROCEDURE verifie_spectacle_is_nos();