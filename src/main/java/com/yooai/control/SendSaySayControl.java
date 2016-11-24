package com.yooai.control;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yooai.modal.Say;
import com.yooai.service.SayService;

@Controller
public class SendSaySayControl {
	@Autowired
	private SayService sayService;
	private static List<String> uploadFilesList = new ArrayList<String>();
	
	@ResponseBody
	@RequestMapping(value="index/say/send",method = RequestMethod.POST)
	public String loadUserHeadImage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8"); 
		//1.用户id
		String userIdParam = request.getParameter("userId");
		int userId = 0;
		if(userIdParam!=null){
			userId = Integer.parseInt(userIdParam);
		}
		//2.说说内容
		String sayContent = request.getParameter("sayContent");
		//3.说说类型
		List<Integer> sayTypesList = new ArrayList<Integer>();
		String sayTypes = request.getParameter("sayTypes");
		if(sayTypes!=null){
			String values[] = sayTypes.split("[,]");
			for (String value : values) {
				System.out.println("类型:"+value);
				sayTypesList.add(Integer.parseInt(value));			//保存说说类型到sayTypes中
			}
		}
		
		//上传文件操作BEGIN
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		String path = request.getServletContext().getRealPath("/temp/imges");
		System.out.println("path : " + path);
		new File(path).mkdir();
		diskFileItemFactory.setRepository(new File(path));
		diskFileItemFactory.setSizeThreshold(1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
		try {
			List<FileItem> list = (List<FileItem>) upload.parseRequest(request);
			for (FileItem item : list) {
				String name = item.getFieldName();
				if (item.isFormField()) {
					String value = item.getString();
					System.out.println("表单属性---->"+name + "=" + value);
				}
				else {
					String value = item.getName(); // 1,获取路径
					int start = value.lastIndexOf("\\");// 2,索引到最后一个反斜杠
					String filename = value.substring(start + 1);//3.截取(+1是去掉反斜杠)
					System.out.println("上传图片--->"+name + "=" + value);
					//保存上传文件到uploadFilesPath中
					File file = null;
					do {
						// 生成文件名
						start = filename.lastIndexOf("."); // 索引到最后一个点
						filename = filename.substring(0, start) // 不含扩展名的文件
								+ UUID.randomUUID().toString() // 随机数
								+ filename.substring(start); // 扩展名
						file = new File(path, filename);
					} while (file.exists());
					System.out.println("filename=" + filename);
					uploadFilesList.add("temp/imges/"+filename);
					request.getSession().setAttribute("uploadFilesPath", uploadFilesList);
					// 写到磁盘上去
					item.write(file);
					System.out.println("the upload file's size:"
							+ item.getSize());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//上传文件操作END
		
		//4.说书的图片地址（事先存在session里面）
				if(sayContent!=null&&userIdParam!=null&&sayTypes!=null){
					List<String> pictureURLs = (List<String>) request.getSession().getAttribute("uploadFilesPath");
					Say say = new Say();
					say.setUserId(userId);
					say.setSayContent(sayContent);
					say.setSaySendtime(new Date());
					sayService.sendSaySay(say, sayTypesList, pictureURLs);
					//清楚session换攒
					request.getSession().removeAttribute("uploadFilesPath");
					uploadFilesList.clear();
					return "true";
				}else{
					return "false";
				}
	}

}
