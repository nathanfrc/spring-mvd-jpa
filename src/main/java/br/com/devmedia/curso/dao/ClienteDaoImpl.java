package br.com.devmedia.curso.dao;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.curso.util.Cripto;
import br.com.devmedia.curso.domain.Cliente;

@Repository
@Transactional
public class ClienteDaoImpl implements ClienteDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void salvar(Cliente cliente) {
		entityManager.persist(cliente);	
	}

	@Override
	public void editar(Cliente cliente) {
		entityManager.merge(cliente);		
	}

	@Override
	public void excluir(Long id) {
		entityManager.remove(entityManager.getReference(Cliente.class, id));		
	}

	@Transactional(readOnly = true)
	@Override
	public Cliente getId(Long id) {
		String jpql = "from Cliente u where u.id = :id";
		TypedQuery<Cliente> query = entityManager.createQuery(jpql, Cliente.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Cliente> getTodos() {
		String jpql = "from Cliente u";
		TypedQuery<Cliente> query = entityManager.createQuery(jpql, Cliente.class);
		return query.getResultList();
	}


	@Transactional(readOnly = true)
	@Override
	public List<Cliente> getByNome(String nome) {
		String jpql = "from Cliente u where u.nome like :nome or u.email like :email";
		TypedQuery<Cliente> query = entityManager.createQuery(jpql, Cliente.class);
		query.setParameter("nome", "%"+nome+"%");
		query.setParameter("sobrenome", "%"+nome+"%");
		return query.getResultList();
	}

	@Transactional(readOnly = true)
	@Override
	public boolean getLogar(String email, String senha, HttpSession sessao) {
		
		 	 Cripto md5 = new Cripto();
		 	 try {
		 		 
				senha = md5.md5(senha);
			} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
				
				e.printStackTrace();
			}
		 	 
		
		try {
			
			String jpql = "from Cliente c where c.email = :email and c.senha = :senha";
			TypedQuery<Cliente> query = entityManager.createQuery(jpql, Cliente.class);
			query.setParameter("email",email);
			query.setParameter("senha", senha);
			
			 Cliente cliente = query.getSingleResult();
			 
			 sessao.setAttribute("id",cliente.getId());
			 sessao.setAttribute("nome", cliente.getNome());
			
			return true;
			
		}catch(NoResultException nre)
		{
			return false;
		}
	}

	@Override
	public boolean getLogar(String email, String senha) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
