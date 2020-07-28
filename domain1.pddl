;;Domain template 1 for cleaning floor regions
;; A domain file for CMP2020M assignment 2017/2018

;; Define the name for this domain (needs to match the domain definition
;; in the problem files)

(define (domain domain-template1)

    ;; We only require some typing to make this plan faster. We can do without!
    (:requirements :typing)

    ;; We have two types: cleaners and the regions, both are objects
    (:types cleaner region - object)

    ;; define all the predicates as they are used in the problem files
    (:predicates  

    ;; described what region a cleaner is at
    (cleaner-at ?c - cleaner ?x - region)


    ;; indicates that region ?x is above region ?y
    (above ?x - region ?y - region)

    ;; indicates that region ?x is below region ?y
    (below ?x - region ?y - region)

    ;; indicates that region ?x is right of region ?y
    (right ?x - region ?y - region)

    ;; indicates that region ?x is left of region ?y
    (left ?x - region ?y - region)
    
    ;; indicates that a region is cleaned
    (cleaned ?x - region)

;; indicates that a region is dirty
    (dirty ?x - region)

    )


;; Action definitions, e.g. 


;; (:action suck
;;  :parameters (?r - cleaner ?x - region ?)
;;  :precondition (and 
;;                                  (...)
;;                              )
;;  :effect (and 
;;                          (...) 
;;                          (...)
;;                  )
;; )


;;This is the first domain file I worked on for the PDDL assignment. This contains the predicates and the actions. 
;; The problem file which was supplied for us is for the ojects, the initial state and the goal specification.
;; An example of a predicate would be cleaner ?x and cleaned? ?x

		(:action suck
	;; This action will clean the floor once it is ready in the requested region. 
	;; The cleaner will only clean the floor if the region is dirty.
	;;The code below shows the parameters which are set that define the programs conditions of it's operations.
	;; This simply asks which cleaner is doing the cleaning and where, which region is the action being fulfilled.
  	  :parameters (?r - cleaner ?x - region ?)
	;; A precondition is a condition that must be completed before anything else in the code can happen.
    ;; For example:This checks whether the region is dirty, followed by checking which region the cleaner is.
	;; If the region is dirty, the cleaner is the dirty region will clean. If not dirty no need to clean. 
 	  :precondition (and (dirty ?x) (cleaner-at ?r ?x))    
    ;;if dirty, the effect will be the cleaner cleaning the region.
  	  :effect (and (not (dirty ?x ))
                   (cleaned ?x))
  
)
;;This action will move the cleaner up a region. 
	  (:action move_up
;;This works out the cleaner that is moving region. It works out which region the cleaner is at, then which region it
;;is moving up to.
     :parameters (?r - cleaner ?x - region ?y - region ?)
;;This needs to be carried out to check if there even is a region above. If there is not a region above
;;the cleaner will stay in the same region.
     :precondition (and (above ?x ?y) (cleaner-at ?r ?y))
;;?x was the original region. This shows that if there is no where to go up, the cleaner will stay at ?x.
     :effect (and (not(cleaner-at ?r ?y))
     (cleaner-at ?r ?x))
)

;;This action will move the cleaner down a region.
	 (:action move_down
;;This works out the cleaner that is moving region. It works out which region the cleaner is at, then which region it
;;is moving down to.
     :parameters (?r - cleaner ?x - region ?y - region ?)
;;This needs to be carried out to check if there even is a region below. If there is not a region below
;;the cleaner will stay in the same region.
     :precondition (and (below ?x ?y)(cleaner-at ?r ?y))
;;?x was the original region. This shows that if there is no where to go down, the cleaner will stay at ?x.
     :effect (and (not(cleaner-at ?r ?y))
     (cleaner-at ?r ?x))
)
;;This action will move the cleaner a region to the left.
	 (:action move_left
;;This works out the cleaner that is moving region. It works out which region the cleaner is at, then which region it
;;is moving left to.
     :parameters (?r - cleaner ?x - region ?y - region ?)
;;This needs to be carried out to check if there even is a region to the left. If there is not a region to the left
;;the cleaner will stay in the same region.
     :precondition (and (left ?x ?y) (cleaner-at ?r ?y))
;;?x was the original region. This shows that if there is no where to go left, the cleaner will stay at ?x.
     :effect (and (not(cleaner-at ?r ?y))
     (cleaner-at ?r ?x))
)
;;This action will move the cleaner a region to the right.
  	 (:action move_right
;;This works out the cleaner that is moving region. It works out which region the cleaner is at, then which region it
;;is moving right to.
   	:parameters (?r - cleaner ?x - region ?y - region ?)
;;This needs to be carried out to check if there even is a region to the right. If there is not a region to the right
;;the cleaner will stay in the same region.
    :precondition (and (right ?x ?y) (cleaner-at ?r ?y))
;;?x was the original region. This shows that if there is no where to go right, the cleaner will stay at ?x.
    :effect (and (not(cleaner-at ?r ?y))
    (cleaner-at ?r ?x))
)
;; ACTIONS that need to be defined:

;; (:action suck
;; )

;; (:action move_up
;; )

;; (:action move_down
;; )

;; (:action move_left
;; )

;; (:action move_right
;; )

;;References:
;;Cs.toronto.edu. (2018). [online] Available at: https://www.cs.toronto.edu/~sheila/2542/s14/A1/introtopddl2.pdf [Accessed 3 May 2018].
;;Veloso, C. (2018). PDDL by Example. [online] Available at: http://www.cs.ust.hk/~qyang/221/PDDL_Examples.pdf [Accessed 3 May 2018].
;;Anon, (2018). [online] Available at: https://blackboard.lincoln.ac.uk/bbcswebdav/pid-1784861-dt-content-rid-3267414_2/courses/CMP2020M-1718/pddl.pdf [Accessed 3 May 2018].
;; Anon, (2018). PDDL. [online] Available at: https://blackboard.lincoln.ac.uk/bbcswebdav/pid-1784861-dt-content-rid-3267413_2/courses/CMP2020M-1718/introtopddl2.pdf [Accessed 3 May 2018].


)

