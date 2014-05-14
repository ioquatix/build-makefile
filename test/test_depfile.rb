# Copyright, 2014, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'minitest/autorun'

require 'build/makefile'

class TestDepfile < MiniTest::Test
	DEPFILE_TEXT = <<-EOF
		target1: source1 source2 \
			source3
		
		target2:
		
		target3: \
			source4
	EOF
	
	def test_parser
		depfile = Build::Makefile.parse(DEPFILE_TEXT)
		
		assert_equal 3, depfile.rules.count
		assert_includes depfile, "target1"
		assert_includes depfile, "target2"
		assert_includes depfile, "target3"
		
		assert_equal %w{source1 source2 source3}, depfile["target1"]
		assert_equal %w{}, depfile["target2"]
		assert_equal %w{source4}, depfile["target3"]
	end
end