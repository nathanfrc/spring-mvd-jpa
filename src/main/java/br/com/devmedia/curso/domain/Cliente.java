package br.com.devmedia.curso.domain;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.*;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "clientes")
public class Cliente {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    @NotBlank
	@NotNull(message = "O campo 'data de nascimento' é requerido.")
	@Size(min = 3, max = 200, message = "Campo requerido entre {min} e {max} caracteres.")	
    private String nome;

    @NotBlank
	@NotNull(message = "O campo 'data de nascimento' é requerido.")
	@Size(min = 3, max = 200, message = "Campo requerido entre {min} e {max} caracteres.")	
    @Column(nullable = false, length = 200)
    @Email(message = "Email inválido")
    private String email;

    @Column(nullable = false, length = 200)
    @NotBlank
   	@NotNull(message = "O campo 'data de nascimento' é requerido.")
    private String senha;

   

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) throws NoSuchAlgorithmException, UnsupportedEncodingException
	{
		   String param = senha;
		
		   MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
	       byte messageDigest[] = algorithm.digest(param.getBytes("UTF-8"));
	         
	       StringBuilder hexString = new StringBuilder();
	       for (byte b : messageDigest) {
	         hexString.append(String.format("%02X", 0xFF & b));
	       }
	       
	       String senhahex = hexString.toString();
	       
	      senha = senhahex;
		this.senha = senha;
	}
	
	
	@Override
	public String toString() {
		return "Cliente [id=" + id + ", nome=" + nome + ", email=" + email+ " , senha= "+senha+"]";
	}
	
	
}
