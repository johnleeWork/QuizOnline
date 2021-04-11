/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package truonglt.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author truon
 */
public class ExamDTO {
    Map<Integer, ExamDetailDTO> cart;

    public ExamDTO() {
    }

    public Map<Integer, ExamDetailDTO> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, ExamDetailDTO> cart) {
        this.cart = cart;
    }

    

    public void addQuestion(ExamDetailDTO examDetail, int index) {
        if (cart == null) {
            cart = new HashMap<Integer, ExamDetailDTO>();
        }       
        if (!cart.containsKey(index)) {
            cart.put(index, examDetail);
        } 
    }


    public void updateQuestion(int answerChoose, int index) {
        if (cart != null) {
            if (cart.containsKey(index)) {
                cart.get(index).setAnswerChoose(answerChoose);
                this.cart.replace(index, cart.get(index));
            }
        }
    }
    
}
