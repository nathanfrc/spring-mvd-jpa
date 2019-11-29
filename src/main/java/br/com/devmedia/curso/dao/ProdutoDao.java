package br.com.devmedia.curso.dao;

import java.util.List;

import br.com.devmedia.curso.domain.Cliente;
import br.com.devmedia.curso.domain.Produto;

public interface ProdutoDao {

	void salvar(Produto produto);
	
	void editar(Produto produto);
	
	void excluir(Long id);
	
	Produto getId(Long id);
	
	List<Produto> getTodos(); 
	
	List<Produto> getByNome(String nome);

	List <Produto> getTodosById(Long idCliente);

}
