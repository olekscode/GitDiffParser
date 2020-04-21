Class {
	#name : #GitDiffLine,
	#superclass : #Object,
	#instVars : [
		'value',
		'isRemovedLine',
		'isAddedLine'
	],
	#category : #GitDiffParser
}

{ #category : #initialization }
GitDiffLine >> initialize [ 
	super initialize.
	isAddedLine := false.
	isRemovedLine := false.
]

{ #category : #accessing }
GitDiffLine >> isAddedLine [
	^ isAddedLine
]

{ #category : #accessing }
GitDiffLine >> isAddedLine: anObject [
	isAddedLine := anObject
]

{ #category : #accessing }
GitDiffLine >> isRemovedLine [
	^ isRemovedLine
]

{ #category : #accessing }
GitDiffLine >> isRemovedLine: anObject [
	isRemovedLine := anObject
]

{ #category : #accessing }
GitDiffLine >> value [
	^ value
]

{ #category : #accessing }
GitDiffLine >> value: anObject [
	value := anObject
]
