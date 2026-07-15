(* V63 library-style representation-migration module *)
(* PATTERN: record-tuple *)
(* TRANSFER_SHAPE: section/retraction *)
(* OBLIGATIONS: 3 *)

Module V63_record_tuple_047.
Record point_47 := mkPoint_47 { x_47 : nat; y_47 : nat }.

Definition to_pair_47 (p : point_47) : nat * nat := (x_47 p, y_47 p).
Definition from_pair_47 (q : nat * nat) : point_47 := mkPoint_47 (fst q) (snd q).
Definition weight_point_47 (p : point_47) : nat := x_47 p + y_47 p.
Definition weight_pair_47 (q : nat * nat) : nat := fst q + snd q.

Theorem from_to_point_47 : forall p : point_47, from_pair_47 (to_pair_47 p) = p.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem to_from_pair_47 : forall q : nat * nat, to_pair_47 (from_pair_47 q) = q.
Proof.
  intros [a b].
  reflexivity.
Qed.

Theorem weight_transfer_47 : forall p : point_47, weight_pair_47 (to_pair_47 p) = weight_point_47 p.
Proof.
  intros [a b].
  reflexivity.
Qed.
End V63_record_tuple_047.

