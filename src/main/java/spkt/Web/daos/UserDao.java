package spkt.Web.daos;

import java.util.List;

import spkt.Web.models.ProductModel;
import spkt.Web.models.UserModel;

public interface UserDao {
    UserModel checkLogin(String userName, String passWord);

    boolean registerUser(UserModel user);

    boolean editProfile(UserModel user);

    Boolean removeUser(Long idUser);

    List<UserModel> getAllUser();

    List<ProductModel> getAllWishList(Long idUser);

    void updatePassword(Long idUser, String passWord);
}
