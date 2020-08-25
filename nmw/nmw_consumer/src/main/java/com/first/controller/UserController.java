package com.first.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.first.entity.Pay;
import com.first.entity.Sheet;
import com.first.entity.User;
import com.first.service.*;
import com.first.tools.Constants;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

@Controller
public class UserController {
    private Logger logger = Logger.getLogger(UserController.class);
    @Reference
    private UserService userService;
	@Reference
	private SheetService sheetService;
	@Reference
	private ListService listService;
    @Reference
    private SongsService songsService;
	@Reference
	private CollectService collectService;
	Map<String, Object> map = new HashMap<>();
	//登陆页
	@RequestMapping("enLogin.html")public String enLogin(){
		return "front/login";
	}
	//音乐主页
    @RequestMapping("first.html")public String first(){
        return "front/index";
    }
	//后台主页面
	@RequestMapping("adminIndex.html")public String adminIndex(){return "system/adminIndex";}
	//管理员信息
	@RequestMapping("adminInfo.html")public String adminInfo(){return "system/adminInfo";}
	//404
	@RequestMapping("404.html")public String silinsi(){return "system/404";}
	//添加歌单
	@RequestMapping("addSheet.html")public String addSheet(){return "system/addSheet";}
	//添加音乐
	@RequestMapping("addSong.html")public String addSong(){return "system/addSong";}
	//添加用户
	@RequestMapping("addUser.html")public String addUser(){return "system/addUser";}
	//忘记密码
	@RequestMapping("adminForget.html")public String adminForget(){return "system/adminForget";}
	//用户登陆
	@RequestMapping("adminLogin.html")public String adminLogin(){return "front/login";}
	//更改密码
	@RequestMapping("adminPassword.html")public String adminPassword(){return "system/adminPassword";}
	//注册
	@RequestMapping("adminReg.html")public String adminReg(){return "front/reg";}
	//控制台
	@RequestMapping("console.html")public String console(){return "system/console";}
	//错误
	@RequestMapping("error.html")public String error(){return "system/error";}
	//主页
	@RequestMapping("homepage.html")public String homepage(){return "system/homepage";}
	//管理员列表
	@RequestMapping("listAdmin.html")public String listAdmin(){return "system/listAdmin";}
	//歌单列表
	@RequestMapping("listSheet.html")public String listSheet(){return "system/listSheet";}
	//歌曲列表
	@RequestMapping("listSong.html")public String listSong(){return "system/listSong";}
	//歌单管理
	@RequestMapping("listSongsList.html")public String listSongsList(){return "system/listSongsList";}
	//用户列表
	@RequestMapping("listUser.html")public String listUser(){return "system/listUser";}
	//寻找
	@RequestMapping("search.html")public String search(){return "system/search";}
	//注册
	@RequestMapping("reg.html")public String reg(){return "front/reg";}
	//更改信息
	@RequestMapping("getUserByName")public String mod(){return "front/person";}

	@RequestMapping(value = "getuserlistbypage",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getuserlistbypage(@RequestParam("page")Integer page
			,@RequestParam("limit")Integer limit
			,@RequestParam(value =  "defaultRole",required = false)Integer defaultRole
			,@RequestParam(value =  "userRole",required = false)Integer userRole
			,@RequestParam(value =  "keyword",required = false)String keyword){
		//转化数据start-----
		if (userRole!=null){
			defaultRole=userRole;
		}
		keyword = "%" + keyword + "%";
		page=(page-1)*limit;
		//转化数据stop-----

		List<User> userList=userService.getUserListByPage(defaultRole,limit,keyword,userRole,page);
		Integer count=userService.getUserCount();
		//注入map
		map.put("data",userList);
		map.put("count",count);
		map.put("code","0");
		map.put("msg","成功");
		map.put("status",1);
		System.out.println(userList);
		return JSON.toJSONString(map);
	}
	//得到管理员信息
	@RequestMapping(value = "getadminone",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAdminOne(@RequestParam("phone")String keyword){
		List<User> userList=userService.getUserOne(keyword);
		//注入map
		map.put("data",userList);
		map.put("code","0");
		map.put("msg","成功");
		map.put("status",1);
		System.out.println(userList);
		return JSON.toJSONString(map);
	}
	//管理员修改密码
	@RequestMapping(value = "modifypasswordbyadmin",produces = "application/json; charset=utf-8")
	@ResponseBody
	public  String modifypasswordbyadmin(@RequestParam("phone")String phone
			,@RequestParam("password")String password
			,@RequestParam("newPassword")String newPassword){
		Integer result=userService.modifyPasswordByAdmin(phone,password,newPassword);
		map.put("data",null);
		map.put("code","0");
		map.put("msg","成功");
		map.put("status",result);
		System.out.println(result);
		return JSON.toJSONString(map);
	}
	//管理员修改信息
	@RequestMapping(value = "modifyuserbyadmin",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String modifyuserbyadmin(@RequestParam(value =  "user_id",required = false)Integer id
			,@RequestParam(value =  "userName",required = false)String userName
			,@RequestParam(value =  "userRole",required = false)Integer userRole
			,@RequestParam(value =  "phone",required = false)String phone
			,@RequestParam(value =  "userPic",required = false)String userPic){
		Integer result=userService.modifyUserByAdmin(id,userName,userRole,phone,userPic);
		map.put("code","0");
		map.put("msg","成功");
		map.put("status",result);
		System.out.println(result);
		return JSON.toJSONString(map);
	}
	//新增用户
	@RequestMapping(value = "adduserbyadmin",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String adduserbyadmin(@RequestParam(value =  "userName",required = false)String userName
			,@RequestParam(value =  "phone",required = false)String phone
			,@RequestParam(value =  "userPwd",required = false)String userPwd
			,@RequestParam(value =  "userPic",required = false)String userPic
			,@RequestParam(value =  "userRole",required = false)Integer userRole){
		//1.新增用户
		if(userPic==null){ userPic="../../../uploadFile/img/39af94b0.jpg"; }//默认用户头像
		Integer result=userService.addUserByAdmin(userName,phone,userPwd,userPic,userRole);
		if (result==1){
			Integer list_id=null;
			Integer song_id=null;
			String sheet_name=null;
			String sheet_pic=null;
			listService.addSongListByAdmin(list_id,song_id); //2.新建list
			sheetService.addSheetByAdmin(sheet_name,sheet_pic,list_id); //3.新建歌单
			collectService.addCollect(); //4.新建收藏夹
			map.put("status",result);
		}else {
			map.put("status",0);
		}
		map.put("code","0");
		map.put("msg","成功");
		System.out.println(result);
		return JSON.toJSONString(map);
	}
	//删除用户
	@RequestMapping(value = "deluserbyuserid",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String deluserbyuserid(@RequestParam(value =  "ids",required = false)String[] ids){
		int[] array = Arrays.asList(ids).stream().mapToInt(Integer::parseInt).toArray();
		int result=0;
		for(int i=0;i<ids.length;i++){
			userService.delCommentByuserId(array[i]);//删除用户评论
			collectService.delCollectByuserId(array[i]);//删除用户收藏
			sheetService.delSheetByuserId(array[i]);//删除个人歌单
			listService.delSongListByuserId(array[i]);//删除list
			result=userService.delUserByuserId(array[i]);//删除用户
		}
		map.put("status",result);
		map.put("code","0");
		map.put("msg","成功");
		System.out.println(result);
		return JSON.toJSONString(map);
	}
	//登录
    @RequestMapping("login.html")
    public String login(@RequestParam(value = "userName",required = false)String userName,
						@RequestParam(value = "userPwd",required = false)String userPwd,
						HttpServletRequest request,@RequestParam(value = "pageIndex", required = false) String pageIndex,
						@RequestParam(value = "pageIndex1", required = false) String pageIndex1,
						Model model) {
		List<Sheet> listSheet=sheetService.getAllSheet();
		model.addAttribute("listSheet",listSheet);
		List<Sheet> listPartSheet=sheetService.getPartSheet();
		model.addAttribute("listPartSheet",listPartSheet);
		List<Sheet> sheetList=listService.getSheetByName(userName);
		model.addAttribute("sheetList",sheetList);

		User user = userService.userLogin(userName,userPwd);
		if(user == null){
			request.setAttribute("error_login","账号密码不能为空");
			return "front/login";
		}
		request.getSession().setAttribute(Constants.USER_SESSION,user);
		model.addAttribute("sheetList",sheetList);
		if(userName.equals("admin")){
			return "system/adminIndex";
		}else {
			return "front/index";
		}
	}

	//头像上传
	@RequestMapping(value = "userMod",method = RequestMethod.POST)
    public String userMod(HttpServletRequest request, User user,@RequestParam(value = "attach",required = false) MultipartFile attach){
    String idPicPath=null; //保存到数据库的文件名
		if (!attach.isEmpty()) { //不为空需要将文件上传到指定目录
			//定义上传的文件路径
			//File.separator表示自动读取操作系统的目录分隔符
			String path=request.getSession().getServletContext().getRealPath( File.separator+"uploadFile/img/");
			System.out.println("上传文件存储的目标路径："+path);
			//获取原文件名
			String oldFileName=attach.getOriginalFilename();
			System.out.println("上传文件原文件名："+oldFileName);
			//获取文件拓展名
			String subfix= FilenameUtils.getExtension(oldFileName);
			logger.info("上传文件原文件拓展名："+subfix);
			int fileSize=10000000;//文件限制大小

			if (attach.getSize()>fileSize) {
				request.setAttribute("uploadFileError", "上传失败,图片过大");
				return "userAdd.html";
			}else if (("jpg").equalsIgnoreCase(subfix)
				||("png").equalsIgnoreCase(subfix)
				||("jpeg").equalsIgnoreCase(subfix)
				||("gif").equalsIgnoreCase(subfix)) {  //判断文件是否符合指定类型
				Random random=new Random();
				String fileName=System.currentTimeMillis()+random.nextInt(10)+"."+subfix; //文件重命名
				logger.info("上传文件重新命名后的文件名："+fileName);

				File targetfile=new File(path,fileName); //根据新文件名创建文件对象

				//如果文件目录不存在则创建新目录
				if (targetfile.exists()) {
					targetfile.mkdirs();
				}

				try {
					attach.transferTo(targetfile);
					idPicPath="../../uploadFile/img/"+fileName;
					logger.info("传入数据库的Url："+idPicPath);
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("uploadFileError", "上传失败");
					return "getUserByName";
				}
			}else {
				request.setAttribute("uploadFileError", "上传失败,图片格式不正确");
				return "getUserByName";
			}
		}
		user.setUserPic(idPicPath);
    if(userService.modify(user)){
		return "front/login";
	}
    return "redirect:getUserByName";
    }

	//得到用户支付信息
	@RequestMapping(value = "getuserpay",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getuserpay(@RequestParam(value =  "user_id",required = false)Integer user_id){
		List<Pay> list=userService.getPayListByUserId(user_id);
		map.put("data",list);
		map.put("code","0");
		map.put("msg","成功");
		System.out.println(list);
		return JSON.toJSONString(map);
	}

}
