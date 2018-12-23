#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Priyanka Karki


#Bugs
#count 0, alpha 2, numberic 1, vowels has 1, phone has 2
#The bug in count alpha is that the code desn't count the capital letters.
#The Bug in count numberic is that it doesn't count the number 0
#The bug in vowels is that it is not counting i's.
#The bugs in phone numbers are that it's not counting 0's or 
# looking for a missing last digit in the last 4 digits of the phonenumber. 

import unittest
import textproc

class TextprocTestCase(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        pass

    @classmethod
    def tearDownClass(cls):
        pass

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_init(self):
        text = "tesing123"
        p = textproc.Processor(text)
        self.assertEqual(p.text, text, "'text' does not match input")

    def test__init__not__string(self):
        notstring = 19
        with self.assertRaises(textproc.TextProcError) as context:
            p = textproc.Processor(notstring)
        self.assertTrue("Processors require strings") #not a string 
    
    def test_count_length(self):
    	stringwidthsize20 = "12345678901234567890"
    	p = textproc.Processor(stringwidthsize20)
    	self.assertEqual(p.count(), 20, "Count isn't equal to full string length")

    def test_count_alphabetic_chars(self):
    	p = textproc.Processor("The quick brown fox jumps over the lazy dog.")
    	self.assertEqual(p.count_alpha(), 35, "Count doesn't count capitals.")
    
    def test_count_numerics_chars(self):
    	p = textproc.Processor("1234567890")
    	self.assertEqual(p.count_numeric(), 10, "Count doesn't count zeroes")
    
    def test_count_vowels(self):
    	p = textproc.Processor("aeiou")
    	self.assertEqual(p.count_vowels(), 5, "Count vowls doesn't count the letter i")
    
    def test_valid_phone_num(self):
    	p = textproc.Processor("248-930-8804")
    	self.assertEqual(p.is_phonenumber(), True, "The phonenumber is not valid beacause of 0's")
    
    def test_valid_pn(self):
    	p = textproc.Processor("303-688-800")
    	self.assertEqual(p.is_phonenumber(), True, "The phonenumber is not valid because it is not checking for last digit")


    # Add Your Test Cases Here...

# Main: Run Test Cases
if __name__ == '__main__':
    unittest.main()
