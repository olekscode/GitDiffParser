Class {
	#name : #GitDiffParser,
	#superclass : #GitDiffGrammar,
	#category : #GitDiffParser
}

{ #category : #'as yet unclassified' }
GitDiffParser >> addedLine [
	^ super addedLine map: [ :_line |
		GitDiffLine new
			value: _line;
			isAddedLine: true;
			yourself ]
]

{ #category : #'as yet unclassified' }
GitDiffParser >> chunk [
	^ super chunk map: [ :_header :_lines |
		GitDiffChunk new
			header: _header;
			lines: _lines;
			yourself ]
]

{ #category : #'as yet unclassified' }
GitDiffParser >> removedLine [
	^ super removedLine map: [ :_line |
		GitDiffLine new
			value: _line;
			isRemovedLine: true;
			yourself ]
]

{ #category : #'as yet unclassified' }
GitDiffParser >> unchangedLine [
	^ super unchangedLine map: [ :_line |
		GitDiffLine new
			value: _line;
			yourself ]
]
