package br.com.devmedia.curso.dao;

import java.util.List;

import br.com.devmedia.curso.domain.Cliente;

public interface LogarDao {


	Cliente getLogar(String email, String senha);
}
