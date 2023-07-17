//@author lmaquin2019274

package interfaces;

import java.util.List;
import model.Login;

public interface CRUDLogin {
    public boolean agregarLogin(Login login);
    public boolean eliminarLogin(int id);
    public List<Login> listarLogins();
    public Login buscarLogin(int id);
}
