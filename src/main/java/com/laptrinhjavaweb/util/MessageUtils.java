package com.laptrinhjavaweb.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MessageUtils {

	public Map<String, String> getMessage(String message) {
		Map<String, String> messageMap = new HashMap<>();
		if ("update_success".equals(message)) {
			messageMap.put("message", "Cập Nhật Thành Công");
			messageMap.put("alert", "success");
		} else if ("insert_success".equals(message)) {
			messageMap.put("message", "Thêm Thành Công");
			messageMap.put("alert", "success");
		}else if("delete_success".equals(message)) {
			messageMap.put("message", "Xóa Thành Công");
			messageMap.put("alert", "success");
		}else if ("system_error".equals(message)) {
			messageMap.put("message", "Thực hiện thất bại!");
			messageMap.put("alert", "danger");
		}
		return messageMap;
	}
}
