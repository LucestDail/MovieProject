package action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

public class PictureAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 이미지 파일 업로드의 위치 : 현재 폴더/picture 폴더로 설정
		String path = request.getServletContext().getRealPath("/") + "movie/member/picture/";
		int size = 10*1024*1024;
		// 폴더가 없으면 새로 만듭니당...
		File pathDirectory = new File(path);
	    if (!pathDirectory.exists()) {
	        pathDirectory.mkdirs();
	    }
		// 이미지 파일 업로드, request 객체 사용 불가하므로 MultipartRequest 사용
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		String fname = multi.getFilesystemName("picture");
		
		//이미지 파일의 3분의 1크기의 섬네일 이미지 생성, 생성 이름은 sm_파일이름.jpg 으로 설정
		BufferedImage bi = ImageIO.read(new File(path + fname));
		int width = bi.getWidth()/3;
		int height = bi.getHeight()/3;
		BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = thumb.createGraphics();
		g.drawImage(bi,0,0,width,height,null);
		File f = new File(path + "sm_" + fname);
		ImageIO.write(thumb,"jpg",f);
		String thumbnail = "sm_" + fname;
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}
