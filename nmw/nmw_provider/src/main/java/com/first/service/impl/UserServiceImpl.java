package com.first.service.impl;



import com.alibaba.dubbo.config.annotation.Service;
import com.first.entity.Pay;
import com.first.entity.Sheet;
import com.first.entity.User;
import com.first.service.UserService;
import javax.annotation.Resource;
import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-13 14:18
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private com.first.dao.UserMapper userMapper;


    @Override
    public Integer getUserCount() {
        return userMapper.getUserCount();
    }

    @Override
    public List<User> getUserListByPage(Integer defaultRole, Integer limit, String keyword, Integer userRole, Integer page) {
        return userMapper.getUserListByPage(defaultRole,limit,keyword,userRole,page);
    }

    @Override
    public List<User> loginUserByPassword(String keyword, String userPwd, Integer userRole) {
        return userMapper.loginUserByPassword(keyword,userPwd,userRole);
    }

    @Override
    public List<User> getUserOne(String keyword) {
        return userMapper.getUserOne(keyword);
    }

    @Override
    public Integer modifyPasswordByAdmin(String phone, String password, String newPassword) {
        return userMapper.modifyPasswordByAdmin(phone,password,newPassword);
    }

    @Override
    public Integer modifyUserByAdmin(Integer id, String userName, Integer userRole, String phone, String userPic) {
        return userMapper.modifyUserByAdmin(id,userName,userRole,phone,userPic);
    }

    @Override
    public Integer addUserByAdmin(String userName, String phone, String   userPwd, String userPic, Integer userRole) {
        return userMapper.addUserByAdmin(userName,phone,userPwd,userPic,userRole);
    }

    @Override
    public Integer delCommentByuserId(Integer user_id) {
        return userMapper.delCommentByuserId(user_id);
    }

    @Override
    public Integer delUserByuserId(Integer id) {
        return userMapper.delUserByuserId(id);
    }

    @Override
    public List<Pay> getPayListByUserId(Integer user_id) {return userMapper.getPayListByUserId(user_id);}

    @Override
    public User getUserByNo(int id) {
        User user=null;
        user=userMapper.getUserByNo(id);
        return user;
    }

    @Override
    public User userLogin(String userName, String userPwd) {
        return userMapper.userLogin(userName,userPwd);
    }

    @Override
    public User getUserByName(String userName) {
        User user=null;
        user=userMapper.getUserByName(userName);
        return user;
    }

    @Override
    public boolean modify(User user) {
        boolean flag = false;

        try {
            if(userMapper.modify(user) > 0)
                flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}

