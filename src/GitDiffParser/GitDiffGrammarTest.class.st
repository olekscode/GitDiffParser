Class {
	#name : #GitDiffGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#category : #GitDiffParser
}

{ #category : #'as yet unclassified' }
GitDiffGrammarTest >> mockChunk [
	^ '@@ -9,6 +9,14 @@ Class {
 	#category : #''Commander2-Commands''
 }
 
+{ #category : #''instance creation'' }
+CmAbstractCommand class >> forContext: anObject [
+	"Creates a new command with anObject as context."
+	^ self new
+		context: anObject;
+		yourself
+]
+
 { #category : #visiting }
 CmAbstractCommand >> acceptVisitor: aCmCommandOrGroup [
 	^ aCmCommandOrGroup visitCommand: self'
]

{ #category : #'as yet unclassified' }
GitDiffGrammarTest >> mockDiff [
	^ '@@ -19,7 +19,7 @@ SpSliderPresenterTest >> initMinMax [
 SpSliderPresenterTest >> testAbsoluteValue [
 	self initMinMax.
 	presenter absoluteValue: 0.5.
-	self assert: presenter value identicalTo: 50
+	self assert: presenter value == 50
 ]
 
 { #category : #tests }
@@ -34,7 +34,7 @@ SpSliderPresenterTest >> testReset [
 	presenter
 		value: 50;
 		reset.
-	self assert: presenter value identicalTo: 0
+	self assert: presenter value == 0
 ]
 
 { #category : #tests }'
]

{ #category : #accessing }
GitDiffGrammarTest >> parserClass [ 
	^ GitDiffGrammar
]

{ #category : #tests }
GitDiffGrammarTest >> testAddedLine [
	| line |
	line := '+Hello world'.
	self parse: line rule: #addedLine.
]

{ #category : #tests }
GitDiffGrammarTest >> testChunk [
	self parse: self mockChunk rule: #chunk.
]

{ #category : #tests }
GitDiffGrammarTest >> testChunkHeader [
	| header |
	header := '@@ -31,12 +35,52 @@'.
	
	self
		parse: header
		rule: #chunkHeader.
]

{ #category : #tests }
GitDiffGrammarTest >> testDocument [
	self parse: self mockDiff rule: #document.
]

{ #category : #tests }
GitDiffGrammarTest >> testLine [
	| line |
	line := 'Hello world'.
	self parserClass new line parse: line.
	self parse: line rule: #line.
]

{ #category : #tests }
GitDiffGrammarTest >> testLines [
	| lines |
	lines := 'Lorem ipsum
- dolor sit
+ amet'.
	self parse: lines rule: #lines.
	self assert: result size equals: 3.
]

{ #category : #tests }
GitDiffGrammarTest >> testRemovedLine [
	| line |
	line := '-Hello world'.
	self parse: line rule: #removedLine.
]

{ #category : #tests }
GitDiffGrammarTest >> testUnchangedLine [
	| line |
	line := 'Hello world'.
	self parserClass new line parse: line.
	self parse: line rule: #unchangedLine.
]
