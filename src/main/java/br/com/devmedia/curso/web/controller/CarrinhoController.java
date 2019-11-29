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

import br.com.devmedia.curso.dao.CarrinhoDao;
import br.com.devmedia.curso.dao.ProdutoDao;
import br.com.devmedia.curso.domain.Carrinho;
import br.com.devmedia.curso.domain.Cliente;
import br.com.devmedia.curso.domain.Produto;


@Controller
@RequestMapping("carrinho")
public class CarrinhoController {

	@Autowired
	private CarrinhoDao dao;
	
	
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
	
	@GetMapping("/card")
	public ModelAndView card(@ModelAttribute("carrinho") Carrinho carrinho, ModelMap model)
	{
		return new ModelAndView("/produtos/card");
	}
	
	@SuppressWarnings("null")
	@GetMapping("/saves")
	public ModelAndView saveProduto(@ModelAttribute("produto") Produto produto, ModelMap model,HttpSession sessao,RedirectAttributes attr) {
		
		Long idsessao = (Long) sessao.getAttribute("id");
		
		System.out.print("id sessao = "+idsessao);
		
		if(idsessao != null)
		{
				Carrinho carrinho = new Carrinho();
				
				carrinho.setIdCliente(idsessao);
				carrinho.setIdProduto(produto.getId());
				carrinho.setNome(produto.getNome());
				carrinho.setDescricao(produto.getDescricao());
				carrinho.setValor(produto.getValor());
				
				dao.salvar(carrinho);
				attr.addFlashAttribute("message", "Adicionado no carrinho com sucesso.");
				return  new ModelAndView("redirect:/");
		}else {
			
			return new ModelAndView("redirect:/");
		}
	
		
	}
	
/*	@PostMapping("/save")
	public String save(@Valid @ModelAttribute("carrinho") Carrinho carrinho, BindingResult result, RedirectAttributes attr,HttpSession sessao) {
		
		if (result.hasErrors()) {
			return "/produtos/cadastro";
		}
		
		Long idsessao = (Long) sessao.getAttribute("id");
		if(idsessao != null)
		{
			
			dao.salvar(carrinho);
			attr.addFlashAttribute("message", "Adicionado no carrinho com sucesso.");
			
			return "redirect:/";
			
		}else {
			
			return "redirect:/";
		}
		
	}
	*/
	
	
	/*@GetMapping("/update/{id}")
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
	
		
	}*/
	
	/*
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
	}	*/
}
