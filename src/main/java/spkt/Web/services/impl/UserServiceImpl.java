package spkt.Web.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spkt.Web.daos.UserDao;
import spkt.Web.models.ProductModel;
import spkt.Web.models.UserModel;
import spkt.Web.services.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public UserModel login(String userName, String passWord) {
	return userDao.checkLogin(userName, passWord);
    }

    @Override
    public Boolean register(UserModel user) {
	return userDao.registerUser(user);
    }

    @Override
    public Boolean editProfile(UserModel user) {
	// TODO Auto-generated method stub
	return userDao.editProfile(user);
    }

    @Override
    public Boolean removeUser(Long idUser) {
	// TODO Auto-generated method stub
	return userDao.removeUser(idUser);
    }

    @Override
    public List<UserModel> getAllUser() {
	// TODO Auto-generated method stub
	return userDao.getAllUser();
    }

    @Override
    public List<ProductModel> getAllWishList(Long idUser) {
	// TODO Auto-generated method stub
	return userDao.getAllWishList(idUser);
    }

    @Override
    public void updatePassword(Long idUser, String passWord) {
	// TODO Auto-generated method stub
	userDao.updatePassword(idUser, passWord);
    }

}
