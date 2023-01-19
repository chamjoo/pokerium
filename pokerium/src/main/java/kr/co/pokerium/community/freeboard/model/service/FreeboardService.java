package kr.co.pokerium.community.freeboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import kr.co.pokerium.community.freeboard.model.vo.FreeboardInfo;

@Service
public interface FreeboardService {

	ArrayList<FreeboardInfo> freeboardList(HashMap<String, Object> map);

	String getPageNavi(HashMap<String, Object> map);

}
