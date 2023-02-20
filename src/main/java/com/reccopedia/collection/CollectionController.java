package com.reccopedia.collection;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/collection")
public class CollectionController {
	

		// 컬렉션 수정 페이지
		@GetMapping("/update_view")
		public String collectionUpdateView(Model model) {
			model.addAttribute("viewName", "collection/collectionUpdate");
			return "template/layout";
		}
		
		// 컬렉션 페이지
		@GetMapping("/collection_view")
		public String collectionPageView(Model model) {
			model.addAttribute("viewName", "collection/collectionPage");
			return "template/layout";
		}
		
		// 컬렉션 목록 페이지
		@GetMapping("/collection_list_view")
		public String collectionListView(Model model) {
			model.addAttribute("viewName", "collection/collectionList");
			return "template/layout";
		}
		
		// 컬렉션 찾기 페이지
		@GetMapping("/collection_find_view")
		public String collectionFindView(Model model)  {
			model.addAttribute("viewName", "collection/collectionFind");
			return "template/layout";
		}
		
		// 컬렉션 생성 페이지
		@GetMapping("/collection_create_view")
		public String collectionCreateView(Model model) {
		model.addAttribute("viewName", "collection/collectionCreate");
			return "template/layout";
		}
}
