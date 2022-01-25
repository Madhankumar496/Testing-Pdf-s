package restassuredtestcases;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.hasItems;
import static org.hamcrest.Matchers.equalTo;
import org.json.simple.JSONObject;
import org.testng.annotations.Test;
import static io.restassured.RestAssured.*;

import static io.restassured.matcher.RestAssuredMatchers.*;
import static org.hamcrest.Matchers.*;
import io.restassured.filter.log.LogDetail;
import io.restassured.http.ContentType;
import io.restassured.matcher.ResponseAwareMatcher;
import io.restassured.response.Response;

public class Assignment8 {

/////////////////////////=================Test1=============================
@Test

public void getValidateUserNotFound() {
	
	System.out.println("===================User not found======================");
	
	baseURI = "https://reqres.in/api";
	
	given()
	     .get("/users/23")
	.then()
	      .statusCode(404)
	      
	      .log().ifStatusCodeIsEqualTo(404)
	      
	      .log().ifValidationFails(LogDetail.STATUS)
	      
	      .log().everything();
	
}

////////////======================================Test2=================================================

@Test

public void getValidateListResource() {
	
	System.out.println("===================Validate List Resource======================");
	baseURI = "https://reqres.in/api";
	
	given()
	     .get("/unknown")
	.then()
	      .statusCode(200)
	      
	      .log().ifStatusCodeIsEqualTo(200)

	      .log().ifValidationFails(LogDetail.STATUS)
	      .log().all();	
}

///////========================Test3==================================
@Test

public void getValidateSingleResource() {
	
	System.out.println("===================Validate Single resource======================");
	baseURI = "https://reqres.in/api";
	
	
	given()
	     .get("/unknown/2")
	.then()
	      .statusCode(200)
	      
	      .body("data.id", equalTo(2))
	      
	      .body("data.name", equalTo("fuchsia rose"))
	      
	      .body("data.year", equalTo(2001))
	      
	      .log().ifStatusCodeIsEqualTo(200)
	      
	      .log().everything();
}

////////////================Test4=============================================

@Test

public void getValidateSingleResourceUserNotFound() {
	
	System.out.println("===================ValidateSingleResourceUserNotFound======================");
	
	baseURI = "https://reqres.in/api";
	
	given()
	     .get("/unknown/23")
	.then()
	      .statusCode(404)
	      
	      .log().ifStatusCodeIsEqualTo(404)
	      
	      .log().everything();	
}

///======================Test5====================
	
	@Test
	public void testPostRequestRegisterSuccesful() {
		
		System.out.println("===================Register successful======================");
	baseURI = "https://reqres.in/api";


	JSONObject json = new JSONObject();
	json.put("email", "eve.holt@reqres.in");
	json.put("password", "pistol");

	System.out.println(json.toJSONString());


	given()
	.body(json.toJSONString())

	.header("Connection", "Keep-alive")
	.contentType(ContentType.JSON)
	.accept(ContentType.JSON)

	.when()
	.post("/register")
	
	.then()
	.statusCode(200)
	
	.log().ifStatusCodeIsEqualTo(200)
	.log().all();
	
	}

/////=============================Test6=====================================
	
	@Test
	public void testPostRequestRegisterUnsuccessful() {
		
		System.out.println("===================Register Unsuccessfull======================");
	baseURI = "https://reqres.in/api";


	JSONObject json = new JSONObject();
	json.put("email", "sydney@fife");


	System.out.println(json.toJSONString());


	given()
	
	.body(json.toJSONString())

	.header("Connection", "Keep-alive")
	.contentType(ContentType.JSON)
	.accept(ContentType.JSON)

	.when()
	.post("/register")
	
	.then()
	.statusCode(400)
	
	.body("error", equalTo("Missing password"))
	.log().body();
	
	}

///========================Test7=======================

@Test

public void testPostloginUnSuccessful() {
	
	System.out.println("===================Login unsuccesfull======================");
	baseURI = "https://reqres.in";
	
	JSONObject reqData = new JSONObject();
	
	reqData.put("email","peter@klaven");
	
	
	System.out.println(reqData.toJSONString());
	
	given()
	      .body(reqData.toJSONString())
	.when()
	      .post("/api/login")
	.then()
	
	    .log().status()
	    .log().ifStatusCodeIsEqualTo(400)
   
            
	    .log().all();
}



///==============================================Test8======================================

	@Test
	public void testEndToEnd() 
	 {
		
		System.out.println("===================End to End Test======================");
	baseURI = "https://reqres.in/api";

///////////Register a user >> extract id and token
	
	System.out.println("=========extracting the token in registered user=====================");
	
	JSONObject json = new JSONObject();
	json.put("email", "eve.holt@reqres.in");
	json.put("password", "pistol");

	System.out.println(json.toJSONString());

	String token =given()
			.body(json.toJSONString())

			.header("charset", "utf-8")
			.contentType(ContentType.JSON)
			.accept(ContentType.JSON)

			.when()
			.post("/register")
			.then()
			.extract().path("token");
			
			System.out.println(token);
			
                //////extract the User ID
			System.out.println("================extracting the user ID in Registered User===============");
			
			
	int UserID =given()
	.body(json.toJSONString())
	.header("charset", "utf-8")
	.contentType(ContentType.JSON)
	.accept(ContentType.JSON)

	.when()
	.post("/register")
	
	.then()
	.extract().path("id");
	
	System.out.println(UserID);
	
	////////Log in with the above created user >> extract token
	System.out.println("=====================extracting  token in Login user==================");
	
	String loginToken = given()
			.body(json.toJSONString())
			.header("charset", "utf-8")
			.contentType(ContentType.JSON)
			.accept(ContentType.JSON)

		.when()
		      .post("/Login")
		.then()
        .extract().path("token");
	
	System.out.println(loginToken);
	
//	/////////Single user//
	// get single user to find the same user id 
	
	System.out.println("========================== get single user to find the same user id=========================");
	
			given()
				.get("/users/" + UserID)
				
		   .then()
				.statusCode(200)
				.body("data.id", equalTo(4))
				.body("data.first_name", equalTo("Eve"))
				.body("data.last_name", equalTo("Holt"))
				.body("data.email", equalTo("eve.holt@reqres.in"))
				.log().body();
			
			// SINGLE <RESOURCE> use the same user id >> validate details
			System.out.println("=====================SINGLE <RESOURCE> use the same user id >> validate detailsget single user to find the same user id=========================");
			
			given()
				.get("/unknown/" +UserID)
		  
			.then()
				.statusCode(200)
				.body("data.id",equalTo(4) )
				.body("data.name", equalTo("aqua sky"))
				//we are logging everything
				.log().everything();
			
			// patch same user >> validate response >> search user >> validate
			System.out.println("========patch same user >> validate response >> search user >> validate================");
			
			json.put("name","John");
			json.put("job","Teacher");
			
			given()		
			 	.body(json.toJSONString())
			 	
		   .when()
				.patch("/users/" + UserID)
				
		   .then()
			   .statusCode(200)
			   .log().body();
			
			System.out.println(UserID + " : Updated Successfully");	
			
			try {
				//searching again if its updated or not
				given()
					.get("/users/" + UserID).
				then()
					.statusCode(200)
					.body("data.id", equalTo(4))
					.log().body();
			     } 
			catch (Exception e)
			{
				
			}
			// delete same user >> validate code >> search user >> validate
			
			System.out.println("====================// delete same user >> validate code >> search user >> validate===================");
			
		when()
			.delete("/users/" + UserID)
			
		.then()
		
			.statusCode(204)
			.log().ifStatusCodeIsEqualTo(204)
		    .log().all();
		
		System.out.println(UserID + " : Deleted Successfully");
		
		//searching again if its deleted or not
		
				given()
					.get("/users/" + UserID)
					
			   .then()
					.statusCode(200)
					.body("data.id", equalTo(4))
					.log().body();
				}
	}


