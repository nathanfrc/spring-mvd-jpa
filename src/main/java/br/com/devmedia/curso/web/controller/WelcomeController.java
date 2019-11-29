package br.com.devmedia.curso.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.devmedia.curso.dao.ProdutoDao;

@Controller
public class WelcomeController {

	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView welcome() {
		ModelAndView view = new ModelAndView("welcome");
		return view;
	}*/
	
	
	@Autowired
	private ProdutoDao dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView listaTodos(ModelMap model) {
		model.addAttribute("produtos", dao.getTodos());
		return new ModelAndView("welcome", model);
	}
	
	
}
