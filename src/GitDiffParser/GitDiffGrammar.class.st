Class {
	#name : #GitDiffGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'any',
		'text',
		'chunkHeader',
		'chunk',
		'document',
		'line',
		'addedLine',
		'removedLine',
		'unchangedLine',
		'lines',
		'newline'
	],
	#category : #GitDiffParser
}

{ #category : #'as yet unclassified' }
GitDiffGrammar >> addedLine [
	^ ($+ asPParser, line) ==> #second.
]

{ #category : #accessing }
GitDiffGrammar >> any [
	^ #any asPParser
]

{ #category : #accessing }
GitDiffGrammar >> chunk [
	^ chunkHeader, lines
]

{ #category : #accessing }
GitDiffGrammar >> chunkHeader [
	^ '@@' asPParser,
		any starLazy flatten,
		'@@' asPParser ==> #second
]

{ #category : #various }
GitDiffGrammar >> document [
	^ chunk islandInSea star
]

{ #category : #'as yet unclassified' }
GitDiffGrammar >> line [
	^ (#any asPParser starLazy: newline) flatten.
]

{ #category : #accessing }
GitDiffGrammar >> lines [
	^ ((addedLine / removedLine / unchangedLine) delimitedBy: newline)
		==> [ :nodes | nodes reject: [ :each | each isToken ] ].
]

{ #category : #'as yet unclassified' }
GitDiffGrammar >> newline [
	^ #newline asPParser token
]

{ #category : #'as yet unclassified' }
GitDiffGrammar >> removedLine [
	^ $- asPParser, line ==> #second.
]

{ #category : #various }
GitDiffGrammar >> start [ 
	^ document
]

{ #category : #accessing }
GitDiffGrammar >> text [
	^ any starLazy flatten
]

{ #category : #'as yet unclassified' }
GitDiffGrammar >> unchangedLine [
	^ line
]
