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

import br.com.devmedia.curso.dao.ProdutoDao;
import br.com.devmedia.curso.domain.Produto;


@Controller
@RequestMapping("produto")
public class ProdutoController {

	@Autowired
	private ProdutoDao dao;
	
	@RequestMapping(value = "/todos", method = RequestMethod.GET)
	public ModelAndView listaTodos(ModelMap model) {
		model.addAttribute("produtos", dao.getTodos());
		return new ModelAndView("/produtos/list", model);
	}
	
	    @GetMapping("/all/{id}")
		public ModelAndView preUpdate2(@PathVariable("id") Long id, ModelMap model) {
	    	

	        if (id == null) {
	            return new ModelAndView("redirect:/produto/todos");
	        }
	    	
	        return new ModelAndView("/produtos/list", "produtos", dao.getTodosById(id));
		}
	
	
	@GetMapping("/cadastro")
	public String cadastro(@ModelAttribute("produto") Produto produto, ModelMap model) {
		return "/produtos/cadastro";
	}
	
	@PostMapping("/save")
	public String save(@Valid @ModelAttribute("produto") Produto produto, BindingResult result, RedirectAttributes attr,HttpSession sessao) {
		if (result.hasErrors()) {
			return "/produtos/cadastro";
		}
		
		Long idsessao = (Long) sessao.getAttribute("id");
		
		if(idsessao != null)
		{
			produto.setIdCliente(idsessao);
			dao.salvar(produto);
			
		}else {
			
			return "/produtos/cadastro";
		}
	
		attr.addFlashAttribute("message", "Produto salvo com sucesso.");
		return "redirect:/produto/all/"+produto.getIdCliente();
	}
	
	@GetMapping("/update/{id}")
	public ModelAndView preUpdate(@PathVariable("id") Long id, ModelMap model,HttpSession sessao) {
		
		
		
		Long idsessao = (Long) sessao.getAttribute("id");
		
		if(idsessao != null)
		{
			Produto produto = dao.getId(id);
			model.addAttribute("produto", produto);
			return new ModelAndView("/produtos/cadastro", model);
			
		}else {
			
			return new ModelAndView("redirect:/produtos/cadastro");
		}
	
		
	}
	
	@GetMapping("/prod/{id}")
	public ModelAndView buscaProd(@PathVariable("id") Long id, ModelMap model,RedirectAttributes redirectAttributes) {
		
		System.out.printf("id do prod="+id);
		
		if(id != null)
		{
			Produto produto = dao.getId(id);
			
			System.out.printf("produto get ="+produto.getId());
			
			//direcionar objeto
			redirectAttributes.addFlashAttribute("produto", produto);
			
			
			//model.addAttribute("produto", produto);
			return new ModelAndView("redirect:/carrinho/saves/");
			
		}else {
			
			return new ModelAndView("redirect:/");
		}
	
		
	}
	
	@PostMapping("/update")
	public ModelAndView update(@Valid @ModelAttribute("produto") Produto produto, BindingResult result, RedirectAttributes attr) {
		if (result.hasErrors()) {
			return new ModelAndView("/produtos/cadastro");
		}
		dao.editar(produto);
		attr.addFlashAttribute("message", "Produto alterado com sucesso.");
		return new ModelAndView("redirect:/produto/all/"+produto.getIdCliente());
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes attr, HttpSession sessao) {
		dao.excluir(id);
		
		attr.addFlashAttribute("message", "Produto excluído com sucesso.");
		
		Long idsessao = (Long) sessao.getAttribute("id");
		
		if(idsessao != null)
		{
			return "redirect:/produto/all/"+idsessao;
		}
		
		
		return "redirect:/";
	}	
}
