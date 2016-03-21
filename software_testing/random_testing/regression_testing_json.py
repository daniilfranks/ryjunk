# Regression Testing
# ------------------
# The goal of this problem is for you to write a regression tester
# for the Queue class.
# 
# Begin by finding and fixing all of the bugs in the Queue class. Next,
# define the function regression_test to take in a list of enqueue inputs
# and dequeue indicators (the returned list of the previous problem) and
# repeat those method calls using the fixed Queue.
# 
# That is, after fixing the Queue class, create a new Queue instance,
# and call the method corresponding to the indicator in the list
# for each item in the list:
# 
# Call the enqueue function whenever you come across an integer, using that
#     integer as the argument.
# Call the dequeue function whenever you come across the 'dq' indicator.

import os.path
import array
import random
import json
import argparse
import collections
from invariants import EnforceCheckRep
from hamcrest import assert_that, contains_string, equal_to, is_not

class DataException(Exception): pass

Q_SIZE = 10

# Fix this Queue class
class Queue(metaclass = EnforceCheckRep):
    
    def __init__(self,size_max):
        self.checkRepcalled = 0
        assert size_max > 0
        self.max = size_max
        self.head = 0
        self.tail = 0
        self.size = 0
        self.data = array.array('i', range(size_max))

    def empty(self):
        return self.size == 0

    def full(self):
        return self.size == self.max

    def enqueue(self,x):
        if self.full():
            raise DataException("Queue full!")
        
        self.data[self.tail] = x
        self.size += 1
        self.tail += 1
        if self.tail == self.max:
            self.tail = 0

    def dequeue(self):
        if self.empty():
            raise DataException("Queue empty!")
        
        x = self.data[self.head]
        self.size -= 1
        self.head += 1
        if self.head == self.max:
            self.head = 0
        return x

    def checkRep(self):            
        self.checkRepcalled+= 1
        assert self.tail >= 0
        assert self.tail < self.max
        assert self.head >= 0
        assert self.head < self.max
        if self.tail > self.head:
            assert (self.tail-self.head) == self.size
        if self.tail < self.head:
            assert (self.head-self.tail) == (self.max-self.size)
        if self.head == self.tail:
            assert (self.size==0) or (self.size==self.max)


# An example list of enqueue integers and dequeue indicators
inpts = [(574, 0), ('dq', 0), (991, 0), ('dq', 0), ('dq', 1),
         (731, 0), (97, 0), ('dq', 0), (116, 0), ('dq', 0),
         (464, 0), (723, 0), (51, 0), ('dq', 0), (553, 0),
         (390, 0), ('dq', 0), (165, 0), (952, 0), ('dq', 0),
         ('dq', 0), (586, 0), (894, 0), ('dq', 0), ('dq', 0),
         (125, 0), (802, 0), (963, 0), (370, 0), ('dq', 0),
         ('dq', 0), (467, 0), (274, 0), ('dq', 0), (737, 0),
         (665, 0), (996, 0), (604, 0), (354, 0), ('dq', 0),
         (415, 0), ('dq', 0), ('dq', 0), ('dq', 0), ('dq', 0),
         ('dq', 0), (588, 0), (702, 0), ('dq', 0), ('dq', 0),
         (887, 0), ('dq', 0), (286, 0), (493, 0), (105, 0),
         ('dq', 0), (942, 0), ('dq', 0), (167, 0), (88, 0),
         ('dq', 0), (145, 0), ('dq', 0), (776, 0), ('dq', 0),
         ('dq', 0), ('dq', 0), ('dq', 0), (67, 0), ('dq', 0),
         ('dq', 0), (367, 0), ('dq', 0), (429, 0), (996, 0),
         (508, 0), ('dq', 0), ('dq', 0), (295, 0), ('dq', 0),
         ('dq', 0), ('dq', 0), (997, 0), ('dq', 0), (29, 0),
         (669, 0), ('dq', 0), (911, 0), ('dq', 0), ('dq', 0),
         (690, 0), (169, 0), (730, 0), (172, 0), (161, 0),
         (966, 0), ('dq', 0), (865, 0), ('dq', 0), (348, 0)]


class Recipe(object):
    def __init__(self, file='output.json'):
        self.mylist = list()

    def record(self, oper, value):
        t = str((oper, value))
        self.mylist.append(t)

    def stop_record(self):
        self.nn = dict()
        self.nn['recipe'] = self.mylist
        with open('output.json', 'w') as self.fh:
            nisse = json.dumps(self.nn, indent=4)
            self.fh.write(nisse)

    def playback(self, input='input.json'):
        with open(input, 'r') as fh:
            data = json.loads(fh.read())

        inpprs = list()
        for i, _ in enumerate(data["recipe"]):
            (oper,value) = eval(data["recipe"][i])

            inpprs.append((oper, int(value)))

        return inpprs

def generate_oper_and_value():
    l = list()
    for _ in range(100):
        if (random.random() < 0.5):
            z = random.randint(0,10000000)
            l.append((z, 0))   
        else:
            l.append(('dq', 0))



# Write a regression tester for the Queue class
def regression_test(l, r = None):
    
    q = Queue(Q_SIZE)
    cntr = {"full":0, "empty":0}

    # Generate random list of tuples (operation, value)
    if r:
        l = list()
        for _ in range(100):
            if (random.random() < 0.5):
                z = random.randint(0,10000000)
                l.append((z, 0))   
            else:
                l.append(('dq', 0))

    # Iterate over tuples ...
    for (oper,value) in l:

        if type(oper) is int:
            try:
                res = q.enqueue(value)
            except DataException as  e:
                value = 1    
                cntr["full"] +=1
                print('queue was full!')
            
        elif oper == 'dq':
            try:
                res = q.dequeue()
            except DataException as  e:            
                value = 1    
                cntr["empty"] +=1
                print('queue was empty, value was:', value)
        else:
            assert_that(oper, equal_to('dq'))
            print ('invalid operation', oper)

        if r:
            r.record(oper,value)

    if r :
        r.stop_record()            

    print('Finished', len(l), "elements processed", Q_SIZE, "queue size")
    print('Failed queue because full:', cntr["full"], 'and dequeue because empty:', cntr["empty"])

    #print('checkrep called:', q.checkRepcalled)


# TODO
# DONE! Work with arguments, record/playback/default
# DONE! pretty print on json files.
# Take care of over- and underflows!
# DONE! Use invariants!

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='This is my first program using argparse')
    parser.add_argument('-r', "--record", action="store_true", 
           help='Record a random queue and dequeue operations on a Queue')
    parser.add_argument('-p', "--playback", action="store_true",default=True,
           help='Playback queue and dequeue operations on a Queue from a default recording or selected')
    args = parser.parse_args()

    recipe = Recipe()


    if args.record:
            print("Recording randomized event ...")
            regression_test([], r = recipe)

    elif args.playback:
        #Check if there exist a file, otherwise pick what we have
        if os.path.exists('input.json'):
            inpts = recipe.playback()
            print("Playback from input.json") 
            regression_test(inpts)
        else:
            print("Playback from internal structure")
            regression_test(inpts)



