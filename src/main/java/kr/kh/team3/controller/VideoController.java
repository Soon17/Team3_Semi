package kr.kh.team3.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class VideoController {

	@GetMapping("/video/{fileName:.+}")
	public void streamVideo(@PathVariable String fileName,
	                        HttpServletRequest request,
	                        HttpServletResponse response) throws IOException {

	    File videoFile = new File("C:/Users/keson/Desktop/upload/resources/static/" + fileName);
	    if (!videoFile.exists()) {
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	        return;
	    }

	    RandomAccessFile video = new RandomAccessFile(videoFile, "r");
	    long length = video.length();
	    long start = 0, end = length - 1;
	    boolean isPartial = false;

	    String range = request.getHeader("Range");
	    if (range != null && range.startsWith("bytes=")) {
	        isPartial = true;
	        String[] ranges = range.substring(6).split("-");
	        start = Long.parseLong(ranges[0]);
	        if (ranges.length > 1) {
	            end = Long.parseLong(ranges[1]);
	        }
	    }

	    long contentLength = end - start + 1;
	    response.reset();
	    response.setBufferSize(1024);
	    response.setContentType("video/mp4");
	    response.setHeader("Accept-Ranges", "bytes");

	    if (isPartial) {
	        response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
	        response.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + length);
	    }

	    response.setHeader("Content-Length", String.valueOf(contentLength));

	    video.seek(start);
	    byte[] buffer = new byte[1024];
	    long bytesLeft = contentLength;
	    OutputStream out = response.getOutputStream();

	    while (bytesLeft > 0) {
	        int bytesToRead = (int)Math.min(buffer.length, bytesLeft);
	        int bytesRead = video.read(buffer, 0, bytesToRead);
	        if (bytesRead == -1) break;
	        out.write(buffer, 0, bytesRead);
	        bytesLeft -= bytesRead;
	    }

	    video.close();
	    out.close();
	}

}
