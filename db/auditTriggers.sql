drop trigger newUser;

 create
        TRIGGER `car_dealership`.`newUser`
        AFTER INSERT ON `car_dealership`.`users`
        FOR EACH ROW
            insert into audit(type, date, user, detail)
            values ('registration', now(), session_user() , NEW.user_name)

create
        TRIGGER `car_dealership`.`delUser`
        AFTER DELETE ON `car_dealership`.`users`
        FOR EACH ROW
            insert into audit(type, date, user, detail)
            values ('delete', now(), session_user() , OLD.user_name)

