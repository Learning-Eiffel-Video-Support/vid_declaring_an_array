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
			l_array: ARRAY [INTEGER]
		do
			do_nothing -- yet ...
		end

	arrayed_list_tests
			-- `'
		local
			l_array: ARRAYED_LIST [INTEGER]
		do
			do_nothing -- yet ...
		end

	arrayed_stack_tests
			-- `'
		local
			l_array: ARRAYED_STACK [INTEGER]
		do
			do_nothing -- yet ...
		end

	arrayn_tests
			-- `'
		local
			l_array: ARRAYN [INTEGER]
		do
			do_nothing -- yet ...
		end

end
