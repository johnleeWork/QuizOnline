/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.dtos;

/**
 *
 * @author truon
 */
public class UserErrorDTO {
    private String emailError;
    private String nameError;
    private String passwordError;

    public UserErrorDTO(String emailError, String nameError, String passwordError) {
        this.emailError = emailError;
        this.nameError = nameError;
        this.passwordError = passwordError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }
    
    
    
}
