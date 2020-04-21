Class {
	#name : #GitDiffParserTest,
	#superclass : #GitDiffGrammarTest,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#category : #GitDiffParser
}

{ #category : #accessing }
GitDiffParserTest >> parserClass [ 
	^ GitDiffParser
]

{ #category : #accessing }
GitDiffParserTest >> testAddedLine [ 
	super testAddedLine.
	
	self assert: result isKindOf: GitDiffLine.
	self assert: result value equals: 'Hello world'.
	self assert: result isAddedLine.
	self deny: result isRemovedLine.
]

{ #category : #accessing }
GitDiffParserTest >> testChunk [
	super testChunk.
	
	self assert: result isKindOf: GitDiffChunk.
	self assert: result header equals: ' -9,6 +9,14 '.
	self assert: result lines size equals: 15.
	
	result lines do: [ :line |
		self assert: line isKindOf: GitDiffLine ].
	
	self assert: (result lines select: [ :line | line isAddedLine ]) size equals: 8.
	self assert: (result lines select: [ :line | line isRemovedLine ]) size equals: 0.
]

{ #category : #accessing }
GitDiffParserTest >> testDocument [
	super testDocument.
	
	self assert: result isKindOf: Collection.
	
	result do: [ :chunk |
		self assert: chunk isKindOf: GitDiffChunk ].
	
	self assert: result size equals: 2.
]

{ #category : #accessing }
GitDiffParserTest >> testRemovedLine [ 
	super testRemovedLine.
	
	self assert: result isKindOf: GitDiffLine.
	self assert: result value equals: 'Hello world'.
	self deny: result isAddedLine.
	self assert: result isRemovedLine.
]

{ #category : #accessing }
GitDiffParserTest >> testUnchangedLine [ 
	super testUnchangedLine.
	
	self assert: result isKindOf: GitDiffLine.
	self assert: result value equals: 'Hello world'.
	self deny: result isAddedLine.
	self deny: result isRemovedLine.
]
