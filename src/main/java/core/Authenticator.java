package core;

import cookies.CodeEncode;
import logic.Ent;
import logic.Persistence;
import model.dao.DAOPgUser;
import model.dto.User;
import utils.MessageFormatted;

import java.util.List;

public class Authenticator {
    private final Persistence persistence;

    public Authenticator(Persistence persistence) {
        this.persistence = persistence;
    }

    public class AuthResult {
        private final boolean ok;
        private final String message;
        private final User user;

        AuthResult(boolean ok, String message, User user) {
            this.ok = ok;
            this.message = message;
            this.user = user;
        }

        public boolean isOk() {
            return this.ok;
        }

        public String message() {
            return this.message;
        }

        public User user() {
            return user;
        }
    }

    public AuthResult auth(String login, String pwd) {
        DAOPgUser dao = persistence.get(Ent.User).dao();
        List<User> byLogin = dao.getByLogin(login, true);
        boolean success = false;
        String message = "";
        User user = new User();

        if (byLogin.isEmpty()) {
            message = new MessageFormatted("Entered email (%s) not found in database", login).get();
        } else if (byLogin.size()>1) {
            message = new MessageFormatted("Looks like you entered only part of your email (%s) because too many matching records found in database", login).get();
        } else {
            user = byLogin.get(0);
            if (!user.getPasswd().equals(new CodeEncode().encrypt(pwd))) {
                message = "Entered password don't match, try again";
            } else {
                success = true;
            }
        }
        return new AuthResult(success, message, user);
    }
}
