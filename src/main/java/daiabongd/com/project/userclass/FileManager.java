package daiabongd.com.project.userclass;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import daiabongd.com.project.Dao.IAdminDao;
import daiabongd.com.project.Vo.goods;
import daiabongd.com.project.Vo.introduce;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FileManager {
	@Autowired
	private IAdminDao IADao;
	String fullPath = "E:\\workspace\\daiabongd\\src\\main\\webapp\\resources\\image\\";

	public void delete(String[] bflist) {
		for (String bf : bflist) {
			File file = new File(fullPath + "upload/" + bf);
			if (file.exists()) {
				file.delete();
			} else {
				log.info("이미 삭제된 파일");
			}
		}

	}

	public void download(String fullPath, String oriFileName, HttpServletResponse resp) throws Exception {

		// 한글파일 깨짐 방지
		String downFile = URLEncoder.encode(oriFileName, "UTF-8");
		/* 파일명 뒤에 이상한 문자가 붙는 경우 아래코드를 해결 */
		// downFile = downFile.replaceAll("\\+", "");
		// 파일 객체 생성
		File file = new File(fullPath);

		// 다운로드 경로 파일을 읽어 들임
		InputStream is = new FileInputStream(file);
		// 반환객체설정
		// 다운로드
		resp.setContentType("application/octet-stream");
		resp.setHeader("content-Disposition", "attachment; filename=\"" + downFile + "\"");
		// 이미지 보여주기
		// resp.setContentType("image/jpeg");
		// 반환객체에 스트림 연결
		OutputStream os = resp.getOutputStream();

		// 파일쓰기
		byte[] buffer = new byte[1024];
		int length;
		while ((length = is.read(buffer)) != -1) {
			os.write(buffer, 0, length);
		}
		os.flush(); // 출력버퍼 삭제
		os.close();
		is.close();
	}

	public boolean fileUp(MultipartHttpServletRequest multi, goods goods) {
		System.out.println("경로 풀" + fullPath);
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "upload/"; // 서버 업로드 경로
		String testpath = fullPath + "upload/"; // 프로젝트폴더 업로드 경로
		System.out.println("경로 테스트" + path);

		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		Map<String, String> fMap = new HashMap<String, String>();
		fMap.put("goods_code", String.valueOf(goods.getGoods_code()));
		int count = IADao.goods_select_count(goods.getGoods_code());
		List<MultipartFile> fList = multi.getFiles("goods_firstshot");
		System.out.println(fList);
		boolean f = false;
		for (int i = 0; i < fList.size(); i++) {
			// 파일 메모리에 저장
			MultipartFile mf = fList.get(i); // 실제파일
			String oriFileName = mf.getOriginalFilename(); // a.txt
			fMap.put("origFileName", oriFileName);
			// 4.시스템파일이름 생성 a.txt ==>112323242424.txt
			String sysFileName = System.currentTimeMillis() + "."
					+ oriFileName.substring(oriFileName.lastIndexOf(".") + 1);
			fMap.put("sysFileName", sysFileName);
			goods.setGoods_firstshot(sysFileName);
			System.out.println("테스트" + goods);
			// 5.메모리->실제 파일 업로드
			System.out.println(fMap);
			if (count == 0) {
				try {
					f = IADao.Goods_Insert(goods);
					mf.transferTo(new File(testpath + sysFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				try {
					mf.transferTo(new File(testpath + sysFileName));
					System.out.println(multi.getParameter("goods_ori_firstshot"));
					new File(testpath + multi.getParameter("goods_ori_firstshot")).delete();
					f = IADao.Goods_Update(goods);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		if (f)
			return true;
		return false;
	}
	public boolean introduce_fileUp(MultipartHttpServletRequest multi, introduce introduce) {
		System.out.println("경로 풀" + fullPath);
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "upload/"; // 서버 업로드 경로
		String testpath = fullPath + "upload/"; // 프로젝트폴더 업로드 경로
		System.out.println("경로 테스트" + path);
		
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdir();
		}
		Map<String, String> fMap = new HashMap<String, String>();
		fMap.put("introduce_code", String.valueOf(introduce.getIntroduce_code()));
		int count = IADao.introduce_select_count(introduce.getIntroduce_code());
		List<MultipartFile> fList = multi.getFiles("firstshot");
		boolean f = false;
		System.out.println("여기까지 왔어요!!");
		System.out.println("테스트" + introduce);
		for (int i = 0; i < fList.size(); i++) {
			// 파일 메모리에 저장
			MultipartFile mf = fList.get(i); // 실제파일
			String oriFileName = mf.getOriginalFilename(); // a.txt
			fMap.put("origFileName", oriFileName);
			// 4.시스템파일이름 생성 a.txt ==>112323242424.txt
			String sysFileName = System.currentTimeMillis() + "."
					+ oriFileName.substring(oriFileName.lastIndexOf(".") + 1);
			fMap.put("sysFileName", sysFileName);
			introduce.setIntroduce_firstshot(sysFileName);
			// 5.메모리->실제 파일 업로드
			System.out.println(fMap);
			if (count == 0) {
				try {
					f = IADao.Introduce_Insert(introduce);
					mf.transferTo(new File(testpath + sysFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} 
		}
		if (f)
			return true;
		return false;
	}
}