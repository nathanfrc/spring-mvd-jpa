package br.com.devmedia.curso.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.devmedia.curso.domain.Cliente;
import br.com.devmedia.curso.domain.Logar;

@Repository
@Transactional
public class LogarDaoImpl implements LogarDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Transactional(readOnly = true)
	@Override
	public Cliente getLogar(String email, String senha) {
		String jpql = "from Cliente c where c.email = :email and c.senha = :senha";
		TypedQuery<Cliente> query = entityManager.createQuery(jpql, Cliente.class);
		query.setParameter("email",email);
		query.setParameter("senha",senha);
		return query.getSingleResult();
	}
	
}
