/**

 @Name：layuiAdmin 内容系统
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：LPPL
    
 */


layui.define(['table', 'form'], function(exports){
  var $ = layui.$
  ,table = layui.table
  ,form = layui.form
  ,admin=layui.admin;

  //歌单
  table.render({
    elem: '#LAY-app-content-list'
    ,url: 'http://localhost:8181/getsheetlistbyadmin' //模拟接口 http://localhost:8181/getsheetlist
    ,cols: [[
      ,{field: 'id', width: 45, title: 'ID', sort: true}
      ,{field: 'sheet_name', title: '名称',}
      ,{field: 'sheet_pic', title: '海报',templet: '#imgTpl'}
      ,{field: 'user_id', title: '上传者'}
       ,{field: 'sheet_collect', title: '收藏量',sort: true}
      ,{field: 'creationDate', title: '上传时间', sort: true}
      ,{title: '操作', align: 'center', fixed: 'right', toolbar: '#table-content-list'}
    ]]
    ,page: true
    ,limit: 10
    ,limits: [10, 15, 20, 25, 30]
    ,text: '对不起，加载出现异常！'
  });
  
  //监听工具条
  table.on('tool(LAY-app-content-list)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){
      layer.confirm('确定删？', function(index){
        console.log(data);
       admin.req({
  		url: "http://localhost:8181/delsheetonebyadmin",
  		data: data,
  		type:"get",
  		success: function(res){
  			if(res.status==0){
  				 obj.del();
    		layer.close(index);
  			}
  		}
  	})
      });
    } else if(obj.event === 'edit'){
      layer.open({
        type: 2
        ,title: '添加歌单'
        ,content: 'addSheet1.html?id='+ data.id
        ,maxmin: true
        ,area: ['550px', '550px']
        ,btn: ['确定', '取消']
        ,yes: function(index, layero){
          var iframeWindow = window['layui-layer-iframe'+ index]
          ,submit = layero.find('iframe').contents().find("#layuiadmin-app-form-edit");

          //监听提交
          iframeWindow.layui.form.on('submit(layuiadmin-app-form-edit)', function(data){
            var field = data.field; //获取提交的字段
            
            //提交 Ajax 成功后，静态更新表格中的数据
            //$.ajax({});              
            obj.update({
              label: field.label
              ,title: field.title
              ,author: field.author
              ,status: field.status
            }); //数据更新
            
            form.render();
            layer.close(index); //关闭弹层
          });  
          
          submit.trigger('click');
        }
      });
    }
  });

  //分类管理
  table.render({
    elem: '#LAY-app-content-tags'
    ,url: layui.setter.base + 'json/content/tags.js' //模拟接口
    ,cols: [[
      {type: 'numbers', fixed: 'left'}
      ,{field: 'id', width: 100, title: 'ID', sort: true}
      ,{field: 'tags', title: '分类名', minWidth: 100}
      ,{title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#layuiadmin-app-cont-tagsbar'}
    ]]
    ,text: '对不起，加载出现异常！'
  });
  
  //监听工具条
  table.on('tool(LAY-app-content-tags)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){
      layer.confirm('确定删除此分类？', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      var tr = $(obj.tr);
      layer.open({
        type: 2
        ,title: '编辑分类'
        ,content: '../../../views/app/content/tagsform.html?id='+ data.id
        ,area: ['450px', '200px']
        ,btn: ['确定', '取消']
        ,yes: function(index, layero){
          //获取iframe元素的值
          var othis = layero.find('iframe').contents().find("#layuiadmin-app-form-tags")
          ,tags = othis.find('input[name="tags"]').val();
          
          if(!tags.replace(/\s/g, '')) return;
          
          obj.update({
            tags: tags
          });
          layer.close(index);
        }
        ,success: function(layero, index){
          //给iframe元素赋值
          var othis = layero.find('iframe').contents().find("#layuiadmin-app-form-tags").click();
          othis.find('input[name="tags"]').val(data.tags);
        }
      });
    }
  });

  //----------------------------单个歌单的歌曲--------------------------------------
  table.render({
    elem: '#songListAA'
    ,url: 'http://localhost:8181/getsonglistbypage'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
       ,{field:'id', title:'ID', width:80, sort: true}
        ,{field:'song_singer', title:'歌手', width:120, sort: true, edit: 'text'}
        ,{field:'song_name', title:'歌曲名', edit: 'text', minWidth: 150}
        ,{field:'song_role', title:'权限', width:80, edit: 'text'}
        ,{field:'song_collect', title:'收藏量', edit: 'text',sort: true}
        ,{field:'song_pic', title:'海报',width: 100,templet: '#imgTpl'}
    ]]
    ,page: true
    ,limit: 10
    ,limits: [10, 15, 20, 25, 30]
    ,text: '对不起，加载出现异常！'
    
  });

  //---------------------------------全部歌曲--------------------------------
  table.render({
    elem: '#LAY-app-content-comm'   
      ,url: 'http://localhost:8181/getSongsAllByPage'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
     ,{field:'id', title:'ID', width:80, sort: true}
        ,{field:'song_singer', title:'歌手', width:120, sort: true, edit: 'text'}
        ,{field:'song_name', title:'歌曲名', edit: 'text', minWidth: 150}
        ,{field:'song_role', title:'权限', width:80, edit: 'text'}
        ,{field:'song_collect', title:'收藏量', edit: 'text',sort: true}
        ,{field:'song_pic', title:'海报',width: 100,templet: '#imgTpl'}
    ]]
    ,page: true
    ,limit: 30
    ,limits: [10, 15, 20, 25, 30]
    ,text: '对不起，加载出现异常！'
  });


  exports('contlist', {})
});