package kr.map.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import kr.login.controller.Controller;

public class MapController implements Controller{
	
	@Override
	public String requestProcessor(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "map/map";
	}
}
