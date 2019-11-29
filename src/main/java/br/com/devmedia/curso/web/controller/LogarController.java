package br.com.devmedia.curso.web.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import br.com.devmedia.curso.dao.LogarDao;
import br.com.devmedia.curso.domain.Logar;


@Controller
@RequestMapping("logar")
public class LogarController {

	@Autowired
	private LogarDao dao;
	
	@PostMapping("/efetuar")
    public ModelAndView validarLogin(@Valid @RequestParam(value = "email") String email, 
    		@RequestParam(value = "senha") String senha ,RedirectAttributes attr) {
	  
	  System.out.printf(email);
	  System.out.printf(senha);
	  
        if (email == null || senha == null) {
        	attr.addFlashAttribute("message", "Email e senha não podem ser vazios.");
            return new ModelAndView("redirect:/cliente/login");
        }
        
        if(dao.getLogar(email, senha) == null)
        {
        	attr.addFlashAttribute("message", "Email e senha não podem ser vazios.");
        	return new ModelAndView("redirect:/cliente/login");
        }
        
        return new ModelAndView("welcome", "clientes", dao.getLogar(email,senha));
    }
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session)
	{
		session.invalidate();
		
		return new ModelAndView("redirect:/");
	}
	
	
}
