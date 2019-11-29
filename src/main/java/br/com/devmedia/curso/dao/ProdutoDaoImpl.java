package br.com.devmedia.curso.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.devmedia.curso.domain.Cliente;
import br.com.devmedia.curso.domain.Produto;

@Repository
@Transactional
public class ProdutoDaoImpl implements ProdutoDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void salvar(Produto produto) {
		entityManager.persist(produto);	
	}

	@Override
	public void editar(Produto produto) {
		entityManager.merge(produto);		
	}

	@Override
	public void excluir(Long id) {
		entityManager.remove(entityManager.getReference(Produto.class, id));		
	}

	@Transactional(readOnly = true)
	@Override
	public Produto getId(Long id) {
		String jpql = "from Produto u where u.id = :id";
		TypedQuery<Produto> query = entityManager.createQuery(jpql, Produto.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Produto> getTodos() {
		String jpql = "from Produto u";
		TypedQuery<Produto> query = entityManager.createQuery(jpql, Produto.class);
		return query.getResultList();
	}


	@Transactional(readOnly = true)
	@Override
	public List<Produto> getByNome(String nome) {
		String jpql = "from Produto u where u.nome like :nome or u.email like :email";
		TypedQuery<Produto> query = entityManager.createQuery(jpql, Produto.class);
		query.setParameter("nome", "%"+nome+"%");
		query.setParameter("sobrenome", "%"+nome+"%");
		return query.getResultList();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Produto> getTodosById(Long idCliente) {
		String jpql = "from Produto p where p.idCliente = :idCliente";
		TypedQuery<Produto> query = entityManager.createQuery(jpql, Produto.class);
		query.setParameter("idCliente", idCliente);
		return query.getResultList();
	}

}
