package com.homemate.entities;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import java.util.List;

@Entity
@Table(name="admin_tbl")
@NamedQuery(name="AdminTbl.findAll", query="SELECT v FROM AdminTbl v")
public class AdminTbl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "sequence-generator")
	@GenericGenerator(name = "sequence-generator",
	strategy = "org.hibernate.id.enhanced.SequenceStyleGenerator",parameters = 
	{
		@Parameter(name = "sequence_name", value = "user_sequence"),
		@Parameter(name = "initial_value", value = "100"),
		@Parameter(name = "increment_size", value = "1")
	})
	@Column(name="username")
	private String username;

	@Column(name="password")
	private String password;
}