package com.first.dao;

import com.first.entity.Pay;
import com.first.entity.User;
import com.first.entity.Sheet;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Description
 * @auther tjj
 * @create 2020-08-13 13:59
 */
@Repository
@Mapper
public interface UserMapper {
   //用户登陆
   public User userLogin(@Param("userName") String userName,@Param("userPwd") String userPwd);
   //通过用户的id
   public User getUserByNo(@Param("id")int id);
   //通过用户的名字
   public User getUserByName(@Param("userName")String userName);
   //修改用户的个人信息
   public int modify(User user) throws Exception;
   //分页+关键字+展示
   public List<User> getUserListByPage(@Param("defaultRole")Integer defaultRole
           ,@Param("limit")Integer limit
           ,@Param("keyword")String keyword
           ,@Param("userRole")Integer userRole
           ,@Param("page")Integer page);
   //管理员密码登录
   public List<User>  loginUserByPassword(@Param("keyword") String keyword
           ,@Param("userPwd") String userPwd
           ,@Param("userRole")Integer userRole);
   //关键字+查询用户
   public List<User> getUserOne(@Param("keyword") String keyword);
   //修改密码(管理员)
   public  Integer modifyPasswordByAdmin(@Param("phone")String phone
           ,@Param("password") String password
           ,@Param("newPassword") String newPassword);
   //修改用户信息
   public Integer modifyUserByAdmin(@Param("id") Integer id
           ,@Param("userName")String userName
           ,@Param("userRole") Integer userRole
           ,@Param("phone") String phone
           ,@Param("userPic") String userPic);
   //新增用户
   public  Integer addUserByAdmin(@Param("userName")String userName
           ,@Param("phone") String phone
           ,@Param("userPwd") String userPwd
           ,@Param("userPic") String userPic
           ,@Param("userRole") Integer userRole);
   //删除用户_删除评论
   public Integer delCommentByuserId(@Param("user_id")Integer user_id);
   //删除用户_删除用户
   public Integer delUserByuserId(@Param("id")Integer id);
   //查询用户数量
   public Integer getUserCount();
   //查询用户会员到期时间
   public List<Pay> getPayListByUserId(@Param("user_id") Integer user_id);


}
