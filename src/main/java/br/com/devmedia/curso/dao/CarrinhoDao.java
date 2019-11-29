package br.com.devmedia.curso.dao;

import java.util.List;

import br.com.devmedia.curso.domain.Carrinho;
import br.com.devmedia.curso.domain.Cliente;
import br.com.devmedia.curso.domain.Produto;

public interface CarrinhoDao {

	void salvar(Carrinho carrinho);
	
	void editar(Carrinho carrinho);
	
	void excluir(Long id);
	
	Carrinho getId(Long id);
	
	List<Carrinho> getTodos(); 
	
	List<Carrinho> getByNome(String nome);

	List <Carrinho> getTodosById(Long idCliente);

}
