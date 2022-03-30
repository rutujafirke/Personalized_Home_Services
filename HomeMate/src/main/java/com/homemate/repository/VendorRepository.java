package com.homemate.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.homemate.entities.VendorTbl;

@Repository
public interface VendorRepository extends JpaRepository<VendorTbl, Integer>{

	/* List<ServicesTbl> findByVendorId(int i); */

	/*
	 * @Query("SELECT V FROM VENDORTBL WHERE V.vendorUsername= ?1 AND V.vendorSPassword=?2"
	 * ) VendorTbl findByVendorUsernameAndVendorPassword(String uname,String pass);
	 */
	
	@Query(value="SELECT * FROM VENDOR_TBL V WHERE V.VENDOR_EMAIL=:username AND V.VENDOR_PASSWORD=:password",nativeQuery = true)
	public VendorTbl loginVendor(@Param("username") String username,@Param("password") String password);
	
}
