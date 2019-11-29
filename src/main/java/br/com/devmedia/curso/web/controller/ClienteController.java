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

import br.com.devmedia.curso.dao.ClienteDao;
import br.com.devmedia.curso.domain.Cliente;
import br.com.devmedia.curso.domain.Logar;


@Controller
@RequestMapping("cliente")
public class ClienteController {

	@Autowired
	private ClienteDao dao;
	
	@PostMapping("/logar")
    public ModelAndView validarLogin(@Valid @RequestParam(value = "email") String email, 
    		@RequestParam(value = "senha") String senha ,Logar logar,RedirectAttributes attr,HttpSession session) {

        if (email == null || senha == null) {
        	attr.addFlashAttribute("message", "Email e senha não podem ser vazios.");
            return new ModelAndView("redirect:/cliente/login");
        }
        
 
        if(dao.getLogar(email, senha, session) == false)
        {
        	attr.addFlashAttribute("message", "Email e senha invá"
        			+ "lidos.");
        	return new ModelAndView("redirect:/cliente/login");
        }
       
        session.setAttribute("email",email);
        
       // return new ModelAndView("welcome", "clientes", dao.getLogar(email,senha));
        return new ModelAndView("redirect:/");
    }	
	
	@RequestMapping(value = "/todos", method = RequestMethod.GET)
	public ModelAndView listaTodos(ModelMap model) {
		model.addAttribute("usuarios", dao.getTodos());
		return new ModelAndView("/user/list", model);
	}
	
	@GetMapping("/cadastro")
	public String cadastro(@ModelAttribute("cliente") Cliente cliente, ModelMap model) {
		return "/cliente/cadastro";
	}
	
	@GetMapping("/login")
	public String login(@ModelAttribute("cliente") Cliente cliente, ModelMap model) {
		return "/cliente/login";
	}
	
	@PostMapping("/save")
	public String save(@Valid @ModelAttribute("cliente") Cliente cliente, BindingResult result, RedirectAttributes attr) {
		if (result.hasErrors()) {
			return "/cliente/cadastro";
		}
		dao.salvar(cliente);
		attr.addFlashAttribute("message", "Usuário salvo com sucesso.");
		return "redirect:/cliente/login";
	}
	
	@GetMapping("/update/{id}")
	public ModelAndView preUpdate(@PathVariable("id") Long id, ModelMap model) {
		Cliente cliente = dao.getId(id);
		model.addAttribute("usuario", cliente);
		return new ModelAndView("/user/add", model);
	}
	
	@PostMapping("/update")
	public ModelAndView update(@Valid @ModelAttribute("usuario") Cliente cliente, BindingResult result, RedirectAttributes attr) {
		if (result.hasErrors()) {
			return new ModelAndView("/user/add");
		}
		dao.editar(cliente);
		attr.addFlashAttribute("message", "Usuário alterado com sucesso.");
		return new ModelAndView("redirect:/usuario/todos");
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes attr) {
		dao.excluir(id);
		attr.addFlashAttribute("message", "Usuário excluído com sucesso.");
		return "redirect:/usuario/todos";
	}	
}
