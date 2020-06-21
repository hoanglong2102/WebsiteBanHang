package com.website.WebsiteBanHang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	@Query("select distinct u from User as u where u.userName = :userName")
	User findByUserName(@Param("userName") String userName);

	@Query("select distinct u from User as u where u.userName = :userName"
			+ " and u.phoneNumber = :phoneNumber and u.email = :email")
	User findByUserNameEmailPhone(@Param("userName") String userName, @Param("phoneNumber") String phoneNumber,
			@Param("email") String email);

	@Query("select u from User as u where u.userName != :userName")
	List<User> findAllUsersExclude(@Param("userName") String userName);

	@Query("select u from User as u where u.userName like %:userName%")
	List<User> findByUserName1(@Param("userName") String userName);

	@Query("select distinct u from User as u where  u.phoneNumber = :phoneNumber")
	User findByPhoneNumber(@Param("phoneNumber") String phoneNumber);

	@Query("select u from User as u where u.userName like %:name% or u.phoneNumber like %:name%")
	List<User> findUserByUserNameAndPhoneNumber(@Param("name") String name);

	@Query("select u from User as u join u.userType t where t.id = 2")
	List<User> findAllManager();

	@Query("select u from User as u join u.userType t where t.id = 3")
	List<User> findAlEmployee();

}
