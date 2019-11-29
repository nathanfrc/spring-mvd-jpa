package br.com.devmedia.curso.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import br.com.devmedia.curso.domain.Cliente;

public interface ClienteDao {

	void salvar(Cliente cliente);
	
	void editar(Cliente cliente);
	
	void excluir(Long id);
	
	Cliente getId(Long id);
	
	List<Cliente> getTodos(); 
	
	List<Cliente> getByNome(String nome);

	boolean getLogar(String email, String senha);

	boolean getLogar(String email, String senha,HttpSession sessao);
}
