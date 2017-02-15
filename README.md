# Matrices

Written in swift that allows for a Matrix of n x (n+1) to be reduced to REF and RREF

Also includes functions for creating and printing the first quadrant of any linear or exponential mathematical function
Sample output:
'''
Welcome to the Matrix RREF calculator. 
 Enter how many rows in a n x (n+1) matrix to solve the system.
2
Input Row 0:
1
2
3
Input Row 1:
4
5
6

[1.0, 2.0, 3.0]
[4.0, 5.0, 6.0]


[1.0, 2.0, 3.0]
[4.0, 5.0, 6.0]

Swap R1 & R1

[1.0, 2.0, 3.0]
[4.0, 5.0, 6.0]

R2 - 4.0R1 -> R2

[1.0, 2.0, 3.0]
[0.0, -3.0, -6.0]

1/-3.0R2 -> R2

[1.0, 2.0, 3.0]
[-0.0, 1.0, 2.0]

R1 - 2.0R2 -> R1

[1.0, 0.0, -1.0]
[-0.0, 1.0, 2.0]

-|                          
-|                          
-|                          
-|                          
-|                          
-|                          
-|***                       
-|   ****                   
-|       ****               
-|           ****           
  ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
-0.0333333333333333(x - 30)^2 + 30
-|                        ***********                         
-|                      **           **                       
-|                    **               **                     
-|                   *                   *                    
-|                 **                     **                  
-|                *                         *                 
-|               *                           *                
-|              *                             *               
-|             *                               *              
-|            *                                 *             
-|           *                                   *            
-|                                                            
-|          *                                     *           
-|         *                                       *          
-|        *                                         *         
-|                                                            
-|       *                                           *        
-|      *                                             *       
-|                                                            
-|     *                                               *      
-|    *                                                 *     
-|                                                            
-|   *                                                   *    
-|                                                            
-|  *                                                     *   
-|                                                            
-| *                                                       *  
-|                                                            
-|*                                                         * 
-|                                                            
  ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
  '''
