package br.com.devmedia.curso.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.devmedia.curso.domain.Carrinho;

@Repository
@Transactional
public class CarrinhoDaoImpl implements CarrinhoDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void salvar(Carrinho carrinho) {
		entityManager.persist(carrinho);	
	}

	@Override
	public void editar(Carrinho carrinho) {
		entityManager.merge(carrinho);		
	}

	@Override
	public void excluir(Long id) {
		entityManager.remove(entityManager.getReference(Carrinho.class, id));		
	}

	@Transactional(readOnly = true)
	@Override
	public Carrinho getId(Long id) {
		String jpql = "from Carrinho u where u.id = :id";
		TypedQuery<Carrinho> query = entityManager.createQuery(jpql, Carrinho.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Carrinho> getTodos() {
		String jpql = "from Carrinho u";
		TypedQuery<Carrinho> query = entityManager.createQuery(jpql, Carrinho.class);
		return query.getResultList();
	}


	@Transactional(readOnly = true)
	@Override
	public List<Carrinho> getByNome(String nome) {
		String jpql = "from Produto u where u.nome like :nome or u.email like :email";
		TypedQuery<Carrinho> query = entityManager.createQuery(jpql, Carrinho.class);
		query.setParameter("nome", "%"+nome+"%");
		query.setParameter("sobrenome", "%"+nome+"%");
		return query.getResultList();
	}
	
	@Transactional(readOnly = true)
	@Override
	public List<Carrinho> getTodosById(Long idCliente) {
		String jpql = "from Produto p where p.idCliente = :idCliente";
		TypedQuery<Carrinho> query = entityManager.createQuery(jpql, Carrinho.class);
		query.setParameter("idCliente", idCliente);
		return query.getResultList();
	}


}
