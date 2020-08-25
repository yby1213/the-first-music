package com.first.service;

import com.first.entity.Pay;
import com.first.entity.Sheet;
import com.first.entity.User;

import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-13 14:15
 */
public interface UserService {
    //通过用户的id
    public User getUserByNo(int id);
    //用户登陆
    public User userLogin(String userName,String userPwd);
    //通过用户的名字
    public User getUserByName(String userName);
    //修改用户的个人信息
    public boolean modify(User user);
    //查询用户数量
    public Integer getUserCount();
    //分页+关键字+展示用户
    public List<User> getUserListByPage(Integer defaultRole,Integer limit,String keyword,Integer userRole,Integer page);
    //管理员密码登录
    public List<User>  loginUserByPassword( String keyword,String userPwd,Integer userRole);
    //关键字+查询用户
    public List<User> getUserOne( String keyword);
    //修改密码(管理员)
    public  Integer modifyPasswordByAdmin(String phone,String password, String newPassword);
    //修改用户信息
    public Integer modifyUserByAdmin( Integer id,String userName,Integer userRole,String phone,String userPic);
    //新增用户
    public  Integer addUserByAdmin(String userName,String phone,String userPwd,String userPic,Integer userRole);
    //删除用户_删除评论
    public Integer delCommentByuserId(Integer user_id);
    //删除用户_删除用户
    public Integer delUserByuserId(Integer id);
    //查询用户会员到期时间
    public List<Pay> getPayListByUserId(Integer user_id);

}
