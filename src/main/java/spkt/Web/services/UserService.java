package spkt.Web.services;

import java.util.List;

import spkt.Web.models.ProductModel;
import spkt.Web.models.UserModel;

public interface UserService {
    UserModel login(String userName, String passWord);

    Boolean register(UserModel user);

    Boolean editProfile(UserModel user);

    Boolean removeUser(Long idUser);

    List<UserModel> getAllUser();

    List<ProductModel> getAllWishList(Long idUser);

    void updatePassword(Long idUser, String password);

}
