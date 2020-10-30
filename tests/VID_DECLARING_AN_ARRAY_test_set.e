note
	description: "Tests of {VID_DECLARING_AN_ARRAY}."
	testing: "type/manual"

class
	VID_DECLARING_AN_ARRAY_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	array_tests
			-- `array_tests'
		local
			l_array: ARRAY [STRING]
		do
			create l_array.make_empty
			create l_array.make_filled ("abc", 1, 100)
			create l_array.make_from_array (<<"my", "new", "array">>)
			create l_array.make_from_special (<<"another", "way">>)
		end

	arrayed_list_tests
			-- `arrayed_list_tests'
		local
			l_array: ARRAYED_LIST [STRING]
		do
			create l_array.make (0) -- empty array (like make_empty above)
			create l_array.make_filled (101) -- 101 empty strings
			create l_array.make_from_array (<<"a", "new", "array">>)
		end

	arrayed_stack_tests
			-- `arrayed_stack_tests'
		local
			l_array: ARRAYED_STACK [INTEGER]
		do
			do_nothing -- yet ...
		end

	arrayn_tests
			-- `arrayn_tests'
		local
			l_array: ARRAYN [INTEGER]
		do
			create l_array.make_n_based (<<[2,2]>>)
			create l_array.make_n_based_filled (<<[2,2]>>, 0)
			create l_array.make_one_based (<<1,2,3,4>>)
			create l_array.make_one_based_filled (<<1,2,3,4>>, 0)
		end

end
